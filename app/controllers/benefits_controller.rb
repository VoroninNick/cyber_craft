class BenefitsController < ApplicationController
  caches_page :index

  def index
    set_page_metadata("benefits")
    @benefits = Benefit.published.sort_by_sorting_position

    add_home_breadcrumb
    add_breadcrumb("benefits")
  end

  def show

  end
end