module BaseIndustriesHelper
  def description_with_image(image, description, **options)
    defaults = {svg: false, image_columns: 3, image_alignment: :left, image: image, description: description, header: nil}
    opts = defaults.merge(options)
    render partial: "base_industries/description_with_image", locals: {opts: opts}
  end

  def full_width_banner_with_title(image, title)
    render partial: "base_industries/full_width_banner_with_title", locals: { opts: { image: image, title: title } }
  end
end