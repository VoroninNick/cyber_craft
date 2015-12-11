module BaseIndustriesHelper
  def description_with_image(image, description, header = nil, svg = false, image_columns = 3, image_alignment = :left)
    opts = { image: image, description: description, header: header, image_columns: image_columns, image_alignment: image_alignment, svg: svg }
    render partial: "base_industries/description_with_image", locals: {opts: opts}
  end

  def _full_width_banner_with_title(image, title)
    render partial: "base_industries/full_width_banner_with_title", locals: { opts: { image: image, title: title } }
  end
end