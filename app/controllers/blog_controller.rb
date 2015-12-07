class BlogController < ApplicationController
  def index
    @available_tags = []
    @available_authors = []

    set_page_metadata("blog")

    add_home_breadcrumb
    add_breadcrumb("blog")

  end

  def show

  end
end