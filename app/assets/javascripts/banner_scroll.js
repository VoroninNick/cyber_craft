//if($("html").filter("[data-controller='pages'][data-action='index'], [data-controller='pages'][data-action='career']").length){
//    $("body").on("wheel", function(e){
//
//        if(e && e.ctrlKey) {
//            return true
//        }
//        //console.log("e: ", e)
//        var $slider = $("#pagi1, .header_style_career")
//        var slider_height = $slider.first().height()
//
//        var $next_section = $slider.next()
//        var next_section_top = $next_section.offset().top
//
//        var scroll_top = $("body").scrollTop() || $(window).scrollTop()
//        scroll_top = Math.ceil(scroll_top)
//        var diff = next_section_top - scroll_top
//        var small_diff = (diff >= -50 && diff <= 50)
//        // scroll_top <= next_section_top
//        var scroll_down = e.originalEvent.deltaY > 0
//        console.log("--------- LOG -----------")
//        console.log("small_diff: ", small_diff)
//        console.log("scroll_down: ", scroll_down)
//        console.log("scroll_top: ", scroll_top)
//        console.log("next_section_top: ", next_section_top)
//        console.log("--------- END -----------")
//
//        if (small_diff && scroll_down ){
//            return true
//        }
//
//        if(  scroll_down){
//            console.log("scroll_home_banner")
//            e.preventDefault()
//
//            scroll_home_banner(slider_height)
//        }
//    })
//}

if($("html").filter("[data-controller='pages'][data-action='index'], [data-controller='pages'][data-action='career']").length){
    $("body").on("wheel", function(e){

        if(e && e.ctrlKey) {
            return true
        }
        //console.log("e: ", e)
        var $slider = $("#pagi1, .header_style_career")
        var slider_height = $slider.first().height()

        var $next_section = $slider.next()
        var next_section_top = $next_section.offset().top

        var scroll_top = $("body").scrollTop() || $(window).scrollTop()
        scroll_top = Math.ceil(scroll_top)
        var diff = next_section_top - scroll_top



        if( scroll_top < next_section_top  && e.originalEvent.deltaY > 0){
            console.log("scroll_home_banner")
            e.preventDefault()

            scroll_home_banner(next_section_top)
        }
    })
}