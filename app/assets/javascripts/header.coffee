

use_custom_scrollbar = false

if use_custom_scrollbar && !Modernizr.touch

  showScrollbar = ()->
    $body = $("body")
    if $body.find(".scrollbar").length == 0
      $scrollbar = $("<div class='scrollbar'><div class='scrollbar-thumb'></div></div>")
      $scrollbar.prependTo($body)

    $body.addClass("has-scrollbar")

  hideScrollbar = ()->
    $body = $("body")
    $body.removeClass("has-scrollbar")

  check_scroll_need = ()->
    $body = $("body")
    body_height = $body.height()
    window_height = window.innerHeight
    thumb_height_percent = window_height / body_height
    return (thumb_height_percent < 1)

  setScrollbarPosition = (include_height = false)->
    $body = $("body")

    scroll_top = $(window).scrollTop()
    body_height = $body.height()

    top_percent = (scroll_top / body_height)

    props = {}
    props.top = "#{top_percent * 100}%"
    if include_height
      window_height = window.innerHeight
      thumb_height_percent = window_height / body_height
      props.height = "#{thumb_height_percent * 100}%"

    $(".scrollbar-thumb").css(props)



  $("body").addClass("custom-scrollbar")
  $(window).on "load", ()->
    if check_scroll_need()
      showScrollbar()
      setScrollbarPosition(true)


  $(document).on "ready", ()->
    if check_scroll_need()
      showScrollbar()
      setScrollbarPosition(true)


  $(window).scroll (e)->

    setScrollbarPosition()


  $(window).on "resize", (e)->
    if check_scroll_need()
      showScrollbar()
      has_scrollbar = $("body").hasClass("has-scrollbar")
      setScrollbarPosition(!has_scrollbar)

$(window).scroll ()->
  $("html").addClass("scrollstart")

$(window).scrollend ()->
  $("html").removeClass("scrollstart")
