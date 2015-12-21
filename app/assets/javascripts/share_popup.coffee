$.fn.open_popup = ()->
  $(this).addClass("open")

$.fn.close_popup = ()->
  $(this).closest(".sharing-popup").removeClass("open")

$(".share_button").on "click", (e)->
  e.preventDefault()
  $(".sharing-popup").open_popup()

$(".close-popup").on "click", (e)->
  $(this).close_popup()