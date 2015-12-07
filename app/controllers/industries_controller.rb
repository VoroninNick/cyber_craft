class IndustriesController < ApplicationController
  def index
    set_page_metadata("industries")

    @industries = Industry.published
  end

  def show

  end
end