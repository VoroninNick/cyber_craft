
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
        play: 5000 * 100,
        scrollable: true
    });


    $('#slides').hammer().on('swipeleft', function() {
        $(this).superslides('animate', 'next');
    });

    $('#slides').hammer().on('swiperight', function() {
        $(this).superslides('animate', 'prev');
    });

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
    new WOW().init();
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



$("body").on("click", ".scroll-down-arrow", function(){
    var top = $("#pagi2").offset().top
    $("body").animate({scrollTop: top})
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