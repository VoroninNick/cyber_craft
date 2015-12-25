module ApplicationHelper


  def stub_image_link(width = 420, height = 350, text = 'item 1', options = {})

    image_url = "http://placehold.it/#{width}x#{height}&text=#{text}&#{options.map{|k, v| "#{k}=#{v}" }.join("&")}"
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
    "https://www.facebook.com/CyberCraft.Lviv/"
  end

  def linkedin_url
    "https://www.linkedin.com/company/cybercraft-inc-"
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


end
