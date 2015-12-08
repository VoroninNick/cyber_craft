module PagesHelper
  def set_page_metadata(page = nil)
    page_class_name = nil
    page_instance = nil
    if page
      case page
        when String
          page_class_name = "Pages::#{page.camelize}"
      end
      page_class = page_class_name.constantize rescue nil

      if page.is_a?(ActiveRecord::Base)
        page_instance = page
        page_class = page.class
        if page_instance.respond_to?(:has_seo_tags?) && page_instance.has_seo_tags?
          @page_metadata = page_instance.seo_tags

        end
      end
    else
      page_class = params[:page_class_name].try(&:constantize)
    end



    @page_class = page_class
    page_instance ||= page_class.try(&:first)
    @page_metadata ||= page_instance.try(&:seo_tags)

    @page_metadata ||= { title: page_class.try(&:default_head_title) }

    if @page_metadata[:title].blank?
      if page_instance.respond_to?(:name)
        @page_metadata[:title] = page_instance.name
      end
    end

    @page_instance = page_instance

    if @page_instance && @page_instance.respond_to?(:banner) && @page_instance.banner.exists?
      set_page_banner_image(@page_instance.banner.url)
      banner_title = nil
      if @page_instance.respond_to?(:banner_title)
        banner_title = @page_instance.banner_title
      elsif @page_instance.respond_to?(:name)
        banner_title = @page_instance.name
      else
        banner_title = page_class.name.demodulize.underscore
      end

      set_page_banner_title(banner_title)


    end

    if @page_instance
      url = nil
      description = nil
      if @page_instance.respond_to?(:bottom_banner) && @page_instance.bottom_banner.exists?
        url = @page_instance.bottom_banner.url
      end

      if @page_instance.respond_to?(:bottom_banner_description) && @page_instance.bottom_banner_description.present?
        description = @page_instance.bottom_banner_description
      end
      set_page_bottom_banner(url, description )
    end
  end

  def html_block_with_fallback(key, from_page_instance = false, &block)
    page_instance = nil
    html_block = nil
    if from_page_instance == true
      page_instance = @page_instance
    elsif from_page_instance.is_a?(Page)
      page_instance = from_page_instance
    end

    page_instance.try do |p|
      if p.respond_to?(key)
        html_block = p.send(key)
      end
      html_block ||= p.html_blocks.by_field(key).first
    end

    if html_block.is_a?(String)
      if html_block.present?
        return raw html_block
      end
    else
      if  (html_block || (html_block = Cms::KeyedHtmlBlock.by_key(key).first))  && html_block.content.present?
        return raw html_block.content
      end
    end

    if block_given?
      yield
      #self.instance_eval(&block)
    end

    nil

  end

  def set_page_banner_image image
    @page_banner_image = image
  end


  def set_page_banner_title title
    @page_banner_title = (I18n.t("page_titles.#{title}", raise: true) rescue title)
  end

  def set_page_bottom_banner image = nil, description = nil
    @page_bottom_banner_image = image
    @page_bottom_banner_description = description
  end
end