class IndustriesController < ApplicationController
  def index
    set_page_metadata("industries")

    @industries = Industry.published


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
    else
      render_not_found
    end
  end

  def init_icons
    @icons = Industry.published.map.map{|item|
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
end