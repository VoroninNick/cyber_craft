if($("html[data-controller=pages][data-action=career]").length) {

// Header in full screen superslides.js
    $('.career_header').superslides({
        animation: 'fade'
    });

    $("#career-countdown time").countDown()

// Scrol career Footer form
    $("body").on("click", ".career_send_message", function () {
        var top = $("#career_footer_scrol1").offset().top
        $("body").animate({scrollTop: top})
    })


    $("body").on("change", "#attach-file-input", function () {
        var $label = $(this).next()
        var $filename = $label.next()
        var filename = $(this).val()

        var attached = filename && filename.length
        if (attached) {
            filename = filename.replace(/C:\\fakepath\\/gi, '')
        }

        var $btn_label = $label.find(".btn-label")
        $filename.text(filename)
        if (attached) {
            $label.addClass("attached")
            $btn_label.text("File attached!")
        }
        else {
            $label.removeClass("attached")
            $btn_label.text("Attach cv")

        }
    })

}