
$(window).on "scrolldelta", (e)->

  # top nav

  scroll_top = $(window).scrollTop()
  $top_nav = $(".top-nav")
  scrolled_class = "scrolled"

  delta = e.scrollTopDelta

  console.log "menu.delta: ", delta

  if scroll_top > 0 && delta < 0
    $top_nav.addClass(scrolled_class)
  else
    $top_nav.removeClass(scrolled_class)






  # top banner
  $banner = (".header_style")
  $banner_title = $(".title_page")
  ratio = 0.3
  current_translate = $banner_title.data("translateY") || 0
  future_translate = current_translate + delta * ratio
  console.log "banner.delta: ", delta
  $banner_title.data("translateY", future_translate)
  $banner_title.css("transform", "translateY(#{future_translate}px)")



$(window).on "scrolldelta", (e)->



