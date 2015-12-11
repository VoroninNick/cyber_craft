// Header in full screen superslides.js
$('.career_header').superslides({
    animation: 'fade'
});


$(document).ready(function(){
    $("#countdown").countdown({
            date: "21 december 2015 11:51:00",
            format: "on"
        },

        function() {
            // callback function
        });
});




// Scrol career block2
$("body").on("click", ".scroll-down-arrow_career", function(){
    var top = $("#career_axperts_2").offset().top
    $("body").animate({scrollTop: top})
})


// Scrol career Footer form
$("body").on("click", ".career_send_message", function(){
    var top = $("#career_footer_scrol1").offset().top
    $("body").animate({scrollTop: top})
})