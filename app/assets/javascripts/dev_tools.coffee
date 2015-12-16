$("body").on "keypress", (e)->
  if e.which == 115 # k
    $("html").toggleClass("highlight-tags")
  #console.log "#{e.type} e: ", e.which