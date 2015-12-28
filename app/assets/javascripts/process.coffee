$(".line-with-arrow").each ()->
  $this = $(this)
  h = $this.height()
  $line_svg = $this.children().filter(".line-svg")
  line_svg = $line_svg.get(0)
  view_box = line_svg.getAttribute("viewBox")
  view_box_parts = view_box.split(' ')
  # = parseInt( view_box_parts[view_box_parts.length])
  view_box_parts[view_box_parts.length - 1] = h
  parts_str = view_box_parts.join(' ')



  #$line_svg.attr("viewBox", parts_str)
  line_svg.setAttribute("viewBox", parts_str)