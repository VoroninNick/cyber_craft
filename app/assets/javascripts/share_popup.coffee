$(".share_button").on "click", (e)->
  e.preventDefault()
  $(".sharing-popup").addClass("open")