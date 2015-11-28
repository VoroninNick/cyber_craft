(
  ($)->
    $.openPopup = (name)->
      $popup = $(".popup[popup-name='#{name}']")
      $popup_wrap = $popup.closest(".popup-wrap")
      built = $popup_wrap.length > 0
      if !built
        title = $popup.attr("data-title")

        $popup_wrap = $("<div class='popup-wrap opened'></div>")
        $popup_overlay = $("<div class='overlay'></div>")

        $popup.wrap($popup_wrap)
        #$popup_wrap.prepend($popup_overlay)
        $popup_overlay.insertBefore($popup)
        $popup_header = $("<div class='header'><div class='title'>#{title}</div><div class='close-button'></div></div>")
        $popup.prepend($popup_header)
      else
        $popup_wrap.addClass("opened")
    $.closePopup = (name)->
      if name instanceof jQuery
        $popup = name
      else
        $popup = $(".popup[popup-name='#{name}']")
      $popup_wrap = $popup.closest(".popup-wrap")
      $popup_wrap.removeClass("opened")





    $(document.body).on "click", "[open-popup]", ()->
      name = $(this).attr("open-popup")
      $.openPopup(name)
    $(document.body).on "click", ".popup-wrap .overlay, .popup .close-button", (event)->
      event.preventDefault()
      $popup = $(this).closest(".popup")
      if $popup.length == 0
        $popup = $(this).closest(".popup-wrap").find(".popup")
      $.closePopup($popup)
)(jQuery)