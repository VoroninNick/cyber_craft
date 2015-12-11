module BaseIndustry
  module InstanceMethods
    def background_image_exists?
      background_image.exists? || avatar.exists?
    end

    def background_image_url
      url = nil
      if background_image.exists?
        url = background_image.url
      end

      if avatar.exists?
        url ||= avatar.url
      end

      url
    end
  end
end