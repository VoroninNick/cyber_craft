
$(window).on "scrolldelta", (e)->
  scroll_top = $(window).scrollTop()
  $top_nav = $(".top-nav")
  scrolled_class = "scrolled"

  delta = e.scrollTopDelta


  if scroll_top > 0 && delta < 0
    $top_nav.addClass(scrolled_class)
  else
    $top_nav.removeClass(scrolled_class)



#$(window).on "scroll", ()->
#  $banner = (".header_style")
