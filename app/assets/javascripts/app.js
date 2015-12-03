
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


    $('#slides').hammer().on('swipeleft', function() {
        $(this).superslides('animate', 'next');
    });

    $('#slides').hammer().on('swiperight', function() {
        $(this).superslides('animate', 'prev');
    });

});
//And js main heder superslides
//Alignment unit .we_height Main page
$(function() {
    $('.we_height').matchHeight();
});
//And Alignment unit  .we_height Main page


// Sidebar Navigation  Main page
$(document).ready(function () {


    $('.scroll-container').onePageScroll({
        topElement: $('header'),
//            position: 'left',
//            background: 'rgba(50,255,100, 0.9)',
//            tooltip: false,
//            tooltipSelector: $('h3'),
//            emptyContent: true,
        sectionSelector: $('.content-part')
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


//Alignment unit .choos_content Main page
$(function() {
    $('.choos_content').matchHeight();
});
//And Alignment unit  .we_height Main page

//Alignment unit .choos_content Main page
$(function() {
    $('.tt_bot').matchHeight();
});
//And Alignment unit  .if_height Main page

//Alignment unit .choos_content Map Main page
$(function() {
    $('.footr_form').matchHeight();
});
//And Alignment unit  .if_height Map Main page

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