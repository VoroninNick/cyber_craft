module BaseIndustriesHelper
  def description_with_image(image, description, **options)
    defaults = {svg: false, image_columns: 3, image_alignment: :left, image: image, description: description, header: nil, decorate_first_letter: false}
    opts = defaults.merge(options)
    render partial: "base_industries/description_with_image", locals: {opts: opts}
  end

  def full_width_banner_with_title(image, title)
    render partial: "base_industries/full_width_banner_with_title", locals: { opts: { image: image, title: title } }
  end

  def with_dotted_bg_if condition, html_options = {}, &block
    if !block_given?
      return
    end

    if condition
      #return content_tag(:div, class: "with_dotted_bg", &block)

      default_html_options = { class: "with_dotted_bg #{html_options.delete(:class)}" }
      html_options = default_html_options.merge(html_options)

      return content_tag(:div, capture(&block), html_options)



    else
      yield
    end


    nil
  end

  def description_with_quote(description, quote, header = nil, **options)

    defaults = {description: description, quote: quote, header: header, background_color_class: nil, decorate_first_letter: false}
    opts = defaults.merge(options)
    render partial: "base_industries/description_with_quote", locals: {opts: opts }
  end
end