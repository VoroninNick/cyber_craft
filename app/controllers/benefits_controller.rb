class BenefitsController < ApplicationController
  def index
    set_page_metadata("benefits")
    @benefits = Benefit.published.sort_by_sorting_position

    add_home_breadcrumb
    add_breadcrumb("benefits")
  end

  def show

  end
end