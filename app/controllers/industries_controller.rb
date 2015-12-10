class IndustriesController < ApplicationController
  def index
    set_page_metadata("industries")

    @industries = Industry.published.sort_by_position


    add_home_breadcrumb
    add_breadcrumb("industries")
  end

  def show
    @industry = Industry.published.where(url_fragment: params[:id]).first
    if @industry
      set_page_metadata(@industry)

      add_home_breadcrumb
      add_breadcrumb("industries")
      add_breadcrumb(@industry.name, false)

      init_icons
      init_articles_navigation
    else
      render_not_found
    end
  end

  def init_icons
    @icons = Industry.published.sort_by_position.map.map{|item|
      h = {};
      h[:name] = item[:name];
      h[:avatar_file_name] = item[:avatar_file_name];
      h[:icon_url] = item.avatar.url();
      h[:icon_path] = item.avatar.path;
      h[:active] = (item.id == @industry.id);
      h[:url] = url_for(item)

      h
    }
  end

  def init_articles_navigation
    articles = Industry.published.sort_by_position.pluck_to_hash(:id, :url_fragment, :name)
    current_index = nil
    articles.each_with_index do |a, i|
      if a[:id] == @industry.id
        current_index = i
        break
      end
    end

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
end