
$(window).on "scrolldelta", (e)->

  # top nav
  $banner = $(".header_style")
  banner_height = $banner.height()

  scroll_top = $(window).scrollTop()
  $top_nav = $(".top-nav")
  scrolled_class = "scrolled"
  visible_class = "visible"

  delta = e.scrollTopDelta

  console.log "menu.delta: ", delta

  if scroll_top > banner_height && delta < 0
    $top_nav.addClass(scrolled_class)

  else
    $top_nav.removeClass(scrolled_class)

  if scroll_top <= banner_height
    $top_nav.addClass(visible_class)
  else
    $top_nav.removeClass(visible_class)





  # top banner

  $banner_title = $(".title_page")
  ratio = 0.6
  current_translate = $banner_title.data("translateY") || 0
  future_translate = current_translate + delta * ratio
  console.log "banner.delta: ", delta
  $banner_title.data("translateY", future_translate)
  $banner_title.css("transform", "translateY(#{future_translate}px)")



$(window).on "scrolldelta", (e)->



