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
  $body = $('body')
  $html_body = $('body, html')
  min_stroll_top = $("#pagi1, .career_header").height() || 0
  max_scroll_top = $("body").height() - $(window).height()
  $window = $(window)

  current_scroll_top = $body.data("scroll_top") || $window.scrollTop()

  deltaY = e.originalEvent.deltaY


  condition = !$body.data("scroll_in_progress") && (current_scroll_top >= min_stroll_top || deltaY < 0)
  console.log "condition: ", condition

  if condition


    #console.log "wheel: ", e
    e.preventDefault()

    #future_scroll_top = current_scroll_top + deltaY * 2.5
    scroll_direction_up = deltaY < 0

    increment = 250

    if scroll_direction_up
      increment = increment * -1




    future_scroll_top = current_scroll_top + increment
    if future_scroll_top > max_scroll_top
      future_scroll_top = max_scroll_top
    if future_scroll_top < 0
      future_scroll_top = 0

    if current_scroll_top != future_scroll_top
      $body.data("scroll_top", future_scroll_top)

      console.log "future_scroll_top: ", future_scroll_top

      $html_body.stop()
      $html_body.animate({scrollTop: future_scroll_top}, {
        duration: 600,
        easing: "easeOutExpo"
        #easing: "easeOutBack"
      })


$(window).scroll ()->
  $("html").addClass("scrollstart")

$(window).scrollend ()->
  $("html").removeClass("scrollstart")