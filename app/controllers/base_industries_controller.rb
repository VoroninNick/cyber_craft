class BaseIndustriesController < ApplicationController


  def init_icons
    @icons = resource_class.published.sort_by_position.map.map{|item|
      h = {};
      h[:name] = item[:name];
      h[:avatar_file_name] = item[:avatar_file_name];
      h[:icon_url] = item.avatar.url();
      h[:icon_path] = item.avatar.path.gsub(/#{Rails.root.join('public/')}/, '')
      h[:active] = (item.id == resource.id);
      h[:url] = url_for(item)

      h
    }
  end

  def init_articles_navigation
    articles = resource_class.published.sort_by_position.pluck_to_hash(:id, :url_fragment, :name)
    current_index = nil
    articles.each_with_index do |a, i|
      if a[:id] == resource.id
        current_index = i
        break
      end
    end

    articles.map{|a|
      a[:url] = send("#{route_resource_name}_path", a[:url_fragment])
    }

    min_index = 0
    max_index = articles.count - 1

    if current_index
      if current_index > min_index
        @prev_article = articles[current_index - 1]
      end

      if current_index < max_index
        @next_article = articles[current_index + 1]
      end
    end
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