$window = $(window)

$("select#sorting_property").select2()
$grid = $(".articles")

disable_isotope = false

$articles_preloader = $(".articles-preloader")

last_loaded_page_number = 1
last_loaded_row_number = 6

load_in_progress = false

if !disable_isotope
  $grid.isotope({
    itemSelector: ".article-item"
  })

check_if_has_tags = (tags)->
  $item = this

  any = false
  item_tags = $item.attr('data-tag-ids').split(",").filter( (a)-> a && a.length   )
  item_authors = $item.attr("data-author-ids")
  for tag in tags
    if item_tags.indexOf(tag) >= 0
      return true

  return false


show_preloader = ()->
  $articles_preloader.removeClass("hide")

hide_preloader = ()->
  $articles_preloader.addClass("hide")

window.load_next_page = ()->
  if !load_in_progress
    load_in_progress = true
    show_preloader()
    page_number = last_loaded_page_number + 1
    $.ajax({
      url: "/blog"
      type: "get"
      dataType: "json"
      data: {
        ajax: true
        page: page_number
      }
      success: (data)->

        items = data.html
        #$grid.append(data.html)
        $items = $(data.html)
        elems = []
        $items.each ()->
          elems.push($(this).get(0))

        hide_preloader()
        $grid.isotope('insert', elems)

        load_in_progress = false
    })

    last_loaded_page_number = last_loaded_page_number + 1

window.filter_grid = ()->
  selected_tag_ids = []
  $selected_tags = $(".tag-list .checked")
  if $selected_tags.length != 1 || !$selected_tags.hasClass("all")
    selected_tag_ids = $selected_tags.map( ()->
      return $(this).children().attr("data-tag-id")
    ).toArray()

  console.log "selected_tags:", selected_tag_ids


  if !disable_isotope
    $grid.isotope(
      filter: ()->
        $item = $(this)
        valid = true
        if !selected_tag_ids.length
          valid = true
        else
          valid = check_if_has_tags.call($item, selected_tag_ids)


        return valid

    )


$("body").on "click", ".tags a", (e)->
  e.preventDefault()
  checked_class = 'checked'
  $a = $(this)
  $li = $a.closest("li")

  is_all = $li.hasClass("all")
  $ul = $li.parent()


  was_checked = $li.hasClass(checked_class)

  if is_all
    $ul.children().filter(":not(.all)").removeClass(checked_class)

  else
    $all = $ul.find('.all')

    $all.removeClass(checked_class)

  if was_checked
    $li.removeClass(checked_class)
  else
    $li.addClass(checked_class)

  if !$ul.find(".#{checked_class}").length
    $all.addClass(checked_class)


  filter_grid()


$("body").on "click", ".sorting-directions :not(.checked)", ()->
  $this = $(this)
  $parent = $this.parent()
  if $this.hasClass("asc")
    $parent.find('.desc').removeClass("checked")
  else
    $parent.find('.asc').removeClass('checked')

  $this.addClass('checked')



$window.on "scroll", ()->
  $items = $grid.find(".article-item")
  item_height = $items.first().outerHeight(true)
  #last_loaded_page_number *

  grid_top = $grid.offset().top
  grid_height = $grid.height()
  grid_bottom = grid_top + grid_height
  window_bottom = $window.scrollTop() + $window.height()
  items_per_row = 3
  rows_to_bottom = Math.ceil((grid_bottom - window_bottom) / item_height)

  condition_to_load = rows_to_bottom <= 3

  if condition_to_load
    load_next_page()



