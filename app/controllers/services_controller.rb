class ServicesController < ApplicationController
  def index
    set_page_metadata("services")


    add_home_breadcrumb
    add_breadcrumb("services")
  end

  def show

  end
end