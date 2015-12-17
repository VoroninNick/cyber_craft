$("select#sorting_property").select2()
$grid = $(".articles")

$grid.isotope({
  itemSelector: ".article-item"
})

filter_grid = ()->
  selected_tags = []
  $selected_tags = $(".tag-list .checked")
  if $selected_tags.length != 1 || $selected_tags.hasClass("all")
    selected_tags = $selected_tags.map ()->
      return $(this).children().text()

  console.log "selected_tags:", selected_tags

  $grid.isotope(
    filter: ()->
      $item = $(this)
      valid = true
      if !selected_tags.length
        valid = true
      else
        any = false
        item_tags = $item.attr('data-tag-ids').split(",").filter( (a)-> a && a.length   )
        item_authors = $item.attr("data-author-ids")
        #for tag in selected_tags
        #if $item


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


