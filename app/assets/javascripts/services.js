//Slider content services
$( document ).ready(function( $ ) {
    $( '#example5' ).sliderPro({
        width: 830,
        height: 500,
        autoplay: true,
        orientation: 'horizontal',
        slideDistance: 0,
        loop: false,
        fade: true,
        arrows: false,
        buttons: false,
        thumbnailsPosition: 'left',
        thumbnailPointer: true,
        thumbnailWidth: 350,
        thumbnailHeight: 71.8,
        fadeArrows: false,
        breakpoints: {
            1000: {
                thumbnailsPosition: 'top',
                thumbnailHeight: 71.8,
                autoplay: false,


            thumbnailWidth: '100%',
            touchSwipeThreshold: 2,
            arrows: true,
            fadeThumbnailArrows: false,
            fadeArrows: false,
            loop: true,
            thumbnailTouchSwipe: true,
            touchSwipeThreshold: false,
            fadeCaption: false,
            thumbnailHeight: 71.8
            }
        }
    });
});


