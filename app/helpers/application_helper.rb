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

  def sharing_popup
    render "sharing_popup"
  end

  def facebook_url
    "https://www.facebook.com/CyberCraft.Lviv/"
  end

  def linkedin_url
    "https://www.linkedin.com/company/cybercraft-inc"
  end
end
