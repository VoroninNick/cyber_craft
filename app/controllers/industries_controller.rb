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
      @icons = Industry.published.map.map{|item| h = {}; h[:name] = item[:name]; h[:avatar_file_name] = item[:avatar_file_name]; h[:icon] = item.avatar.url(); h }
    else
      render_not_found
    end
  end
end