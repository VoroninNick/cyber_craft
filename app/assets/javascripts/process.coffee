
initialize_arrows = ()->
  $(".line-with-arrow").each ()->
    $this = $(this)
    h = $this.height()
    $line_svg = $this.find("svg.line-svg")
    line_svg = $line_svg.get(0)
    view_box = line_svg.getAttribute("viewBox")
    view_box_parts = view_box.split(' ')
    # = parseInt( view_box_parts[view_box_parts.length])


    line_offset_top = $this.offset().top

    $step = $this.closest(".step_content")
    $next_step = $step.next()
    next_step_top = $next_step.offset().top


    indent = 12

    h = next_step_top - line_offset_top - indent

    view_box_parts[view_box_parts.length - 1] = h
    parts_str = view_box_parts.join(' ')

    $this.height(h)




    #$line_svg.attr("viewBox", parts_str)
    line_svg.setAttribute("viewBox", parts_str)

$(document).on "ready", initialize_arrows

$(".step").imagesLoaded initialize_arrows
$(window).on "resize", initialize_arrows