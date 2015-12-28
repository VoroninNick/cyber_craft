$.fn.open_popup = ()->
  $(this).addClass("open")
  $("body").addClass("open-popup open-sharing-popup")

$.fn.close_popup = ()->
  $(this).closest(".sharing-popup").removeClass("open")
  $("body").removeClass("open-popup open-sharing-popup")

$(".share_button, .share-popup-link").on "click", (e)->
  e.preventDefault()
  $(".sharing-popup").open_popup()

$(".close-popup").on "click", (e)->
  $(this).close_popup()

