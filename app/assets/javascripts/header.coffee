handle_scroll = (e)->

  # top nav
  $banner = $(".header_style, #pagi1")
  banner_height = $banner.height()

  scroll_top = $(window).scrollTop()
  $top_nav = $(".top-nav")
  scrolled_class = "scrolled"
  visible_class = "visible"

  if e && e.scrollTopDelta
    delta = e.scrollTopDelta
  else
    delta = e

  #console.log "menu.delta: ", delta

  if scroll_top > banner_height && delta < 0
    $top_nav.addClass(scrolled_class)

  else
    $top_nav.removeClass(scrolled_class)

  if scroll_top <= banner_height
    $top_nav.addClass(visible_class)
  else
    $top_nav.removeClass(visible_class)





  # top banner

  $banner_title = $(".title_page:not(.disable-scroll)")
  if $banner_title.length
    ratio = 0.6
    current_translate = $banner_title.data("translateY") || 0
    future_translate = current_translate + delta * ratio

    $banner_title.data("translateY", future_translate)
    $banner_title.css("transform", "translateY(#{future_translate}px)")

$(window).on "scrolldelta", handle_scroll

handle_scroll(0)




$(window).on "scrolldelta", (e)->

$(window).on "wheel", (e)->
  min_stroll_top = $("#pagi1, .career_header").height() || 0

  current_scroll_top = $('body').data("scroll_top") || $('body').scrollTop()

  deltaY = e.originalEvent.deltaY

  condition = current_scroll_top >= min_stroll_top || deltaY < 0
  console.log "condition: ", condition

  if condition

    #console.log "wheel: ", e
    e.preventDefault()

    future_scroll_top = current_scroll_top + deltaY * 2.5
    if future_scroll_top < 0
      future_scroll_top = 0
    $('body').data("scroll_top", future_scroll_top)

    $('body').stop()
    $('body').animate({scrollTop: future_scroll_top}, {
      duration: 1000,
      easing: "easeOutExpo"
      #easing: "easeOutBack"
    })


$(window).scroll ()->
  $("html").addClass("scrollstart")

$(window).scrollend ()->
  $("html").removeClass("scrollstart")