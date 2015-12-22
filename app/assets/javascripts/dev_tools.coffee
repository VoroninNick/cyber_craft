$("body").on "keypress", (e)->
  if !$(e.target).filter("textarea, input, button").length && e.which == 115 # k
    console.log "e: #{e.type}", e
    $("html").toggleClass("highlight-tags")

  #console.log "#{e.type} e: ", e.which