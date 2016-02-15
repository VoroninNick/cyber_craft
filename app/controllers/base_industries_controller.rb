class BaseIndustriesController < ApplicationController


  def init_icons
    @icons = resource_class.published.sort_by_position.map.map{|item|
      h = {};
      h[:name] = item[:name];
      h[:avatar_file_name] = item[:avatar_file_name];
      h[:icon_url] = item.avatar.url();
      h[:icon_path] = item.avatar.path.gsub(/#{Rails.public_path}/, '')
      h[:active] = (item.id == resource.id);
      h[:url] = url_for(item)

      h
    }
  end

  def init_articles_navigation
    @prev_article = resource.prev_article
    @next_article = resource.next_article
  end

  def resource_class
    raise NotImplementedError
  end

  def resource
    raise NotImplementedError
  end

  def resources
    raise NotImplementedError
  end

  def route_resource_name
    resource_class.name.underscore
  end

  helper_method :resource_class, :resource, :resources
end