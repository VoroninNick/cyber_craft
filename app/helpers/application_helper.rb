module ApplicationHelper


  def stub_image_link(width = 420, height = 350, text = 'item 1', options = {})
    color_str = ""
    colors = []

    if options[:bg]
      colors << options.delete(:bg)
    end

    if options[:color]
      colors << options.delete(:color)
    end



    color_str = colors.join("/")
    image_url = "http://placehold.it/#{width}x#{height}/#{color_str}?text=#{text}&#{options.map{|k, v| "#{k}=#{v}" }.join("&")}"
    image_url
  end

  def stub_image(width = 420, height = 350, text = 'item 1', options = {}, html_options = {})
    image_url = stub_image_link(width, height, text, options)
    html_options[:src] = image_url
    output = "<img "
    html_options.each_pair do |key, value|
      output += "#{key}='#{value}' "
    end
    output += "/>"
    output.html_safe
  end

  def sharing_popup(title = nil)
    title ||= @page_instance.try(&:name)
    render "sharing_popup", title: title
  end

  def sharing_panel(date = nil)
    render "sharing_panel", date: date
  end

  def facebook_url
    res = Pages.contacts.facebook_profile_url
    res = "https://www.facebook.com/CyberCraft.Lviv/" if res.blank?

    res
  end

  def linkedin_url
    res = Pages.contacts.linkedin_profile_url
    res = "https://www.linkedin.com/company/cybercraft-inc-" if res.blank?

    res

  end

  def facebook_share_href
    self_url = request.original_url
    "http://www.facebook.com/sharer/sharer.php?u=#{self_url}"
  end

  def twitter_share_href
    self_url = request.original_url
    "https://twitter.com/home?status=#{self_url}"
  end

  def google_plus_share_href
    self_url = request.original_url
    "https://plus.google.com/share?url=#{self_url}"
  end

  def linkedin_share_href
    self_url = request.original_url
    title = ""
    summary = ""
    source = ""
    "https://www.linkedin.com/shareArticle?mini=true&url=#{self_url}&title=#{title}&summary=#{summary}&source=#{source}"
  end

  def share_onclick(window_title)
    "return !window.open(this.href, '#{window_title}', 'width=640,height=300')"
  end

  def linkedin_api_key
    #'777k5im778t3wl'
    '775wsx8agvaj8a'
  end

  def linkedin_secret_key
  end

  def video_url
    "https://vimeo.com/151523392"
  end

  def og_image

  end

end
