class IndustriesController < ApplicationController
  def index
    set_page_metadata("industries")

    @industries = Industry.published


    add_home_breadcrumb
    add_breadcrumb("industries")
  end

  def show

  end
end