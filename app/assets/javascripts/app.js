
// js main heder superslides
$(document).ready(function() {
    $(document).on('init.slides', function() {
        $('.loading-container').fadeOut(function() {
            $(this).remove();
        });
    });

    $('#slides').superslides({
        slide_easing: 'easeInOutCubic',
        slide_speed: 800,
        pagination: true,
        animation: 'fade',
        hashchange: false,
        play: 5000,
        scrollable: true
    });


    //$('#slides').hammer().on('swipeleft', function() {
    //    $(this).superslides('animate', 'next');
    //});
    //
    //$('#slides').hammer().on('swiperight', function() {
    //    $(this).superslides('animate', 'prev');
    //});

});



// Sidebar Navigation  Main page
$(document).ready(function () {


    $('.scroll-container').onePageScroll({
        buttonColor: "transparent",
        tooltipBackground: "#F90",
        tooltipColor: "black",
        //topElement: $('header'),
//            position: 'left',
//            background: 'rgba(50,255,100, 0.9)',
//            tooltip: false,
//            tooltipSelector: $('h3'),
//            emptyContent: true,
        sectionSelector: $('.content-part'),
        scrollIncrement: false
    });

    $("body").on("navigation_move_start", function(e, args) {
        $body = $("body")
        $body.addClass("navigation_move")
        //console.log("args", arguments)
        $body.data("scroll_top", args.top_to_scroll)
    })

    $("body").on("navigation_move_end", function() {
        $("body").removeClass("navigation_move")
    })

    $('.setOff').click(function () {
        console.log('off');
        $('.scroll-container').onePageScrollDestroy({
            offsetAktiv: 0,
            topMargin: 0

        });
    })
});
//And Sidebar Navigation  Main page





// Slider Main page
$(document).ready(function() {

    $("#reviews").owlCarousel({
        pagination: false,
        navigation: true,
        singleItem : true
    });

});
//End Slider Main page


// Slider Main page
$(document).ready(function(){
    $('.industrieswehelp').bxSlider({
        pagerSelector: '.industriewwepager',
        auto: true
    });
});
//End Slider Main page
// Animated css scroll
$(document).ready(function(){
    if(!Modernizr.touch) {
        new WOW().init();
    }
});
// Animated css scroll
// Form animated Main page
$(document).ready(function() {

    $('input').each(function() {

        $(this).on('focus', function() {
            $(this).parent('.css').addClass('active');
        });

        $(this).on('blur', function() {
            if ($(this).val().length == 0) {
                $(this).parent('.css').removeClass('active');
            }
        });

        if ($(this).val() != '') $(this).parent('.css').addClass('active');

    });

});


$(document).ready(function() {

    $('textarea').each(function() {

        $(this).on('focus', function() {
            $(this).parent('.css').addClass('active');
        });

        $(this).on('blur', function() {
            if ($(this).val().length == 0) {
                $(this).parent('.css').removeClass('active');
            }
        });

        if ($(this).val() != '') $(this).parent('.css').addClass('active');

    });

});
//And Form animated Main page


scroll_home_banner = function(top) {
    if (top == undefined) {
        top = $("#pagi2").offset().top
    }
    var $html_body = $('body, html')
    var $body = $("body")
    if(top < 0){
        top = 0
    }

    var scroll_top = $("body").scrollTop() || $(window).scrollTop()

    if(scroll_top != top && !$body.data("scroll_in_progress")) {
        $html_body.stop()
        $body.data("scroll_in_progress", true)

        $body.data("scroll_top", top)



        $html_body.animate(
            {scrollTop: top},
            {
                duration: 1000,
                easing: "easeInCubic",
                //specialEasing: "easeInOutElastic"
                complete: function(){
                    $body.data("scroll_in_progress", false)
                }
            }
        )
    }
}

$("body").on("click", ".scroll-down-arrow, .scroll-down-arrow_career", function(){
    var slider_height = $("#pagi1, .header_style_career").first().height()
    scroll_home_banner(slider_height)
})




//And js main heder superslides
//Alignment unit .we_height Main page
$(function() {
    var selector = ".choos_content, .we_height, .tt_bot, .footr_form"
    $(selector).matchHeight();

});
//And Alignment unit  .we_height Main page


$(".custom-first-letter").each(function(){
    var $block = $(this)
    var block_text = $block.text()
    var first_letter = block_text[0]
    var rest_text = block_text.substr(1)
    $block.text(rest_text)
    var $first_letter = $("<span class='first-letter'>" + first_letter + "</span>")
    $block.prepend($first_letter)
})

//$("ul.industrieswehelp li").each(function(){
//    var $item = $(this)
//    $item.find(".home-industries-banner-image-div, .home-industries-description-column").matchHeight()
//})
