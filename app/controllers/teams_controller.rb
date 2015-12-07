class TeamsController < ApplicationController


  def index
    set_page_metadata("teams")

    #set_page_banner_image(asset_path('page_banners/services-1920x500.jpg'))
    #set_page_banner_title("teams")

    @teams = Team.published

    add_home_breadcrumb
    add_breadcrumb("teams")

  end

  def show

  end
end