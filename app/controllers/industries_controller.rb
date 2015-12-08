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
      @icons = Industry.published.pluck_to_hash
    else
      render_not_found
    end
  end
end