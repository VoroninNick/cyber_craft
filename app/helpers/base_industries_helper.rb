module BaseIndustriesHelper
  def description_with_image(image, description, **options)
    defaults = {svg: false, image_columns: 3, image_alignment: :left, image: image, description: description, header: nil}
    opts = defaults.merge(options)
    render partial: "base_industries/description_with_image", locals: {opts: opts}
  end

  def full_width_banner_with_title(image, title)
    render partial: "base_industries/full_width_banner_with_title", locals: { opts: { image: image, title: title } }
  end

  def with_dotted_bg_if condition, &block
    if !block_given?
      return
    end

    if condition
      #return content_tag(:div, class: "with_dotted_bg", &block)

      return content_tag(:div, capture(&block), class: "with_dotted_bg")



    else
      yield
    end


    nil
  end
end