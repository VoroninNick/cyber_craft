class TeamsController < ApplicationController


  def index
    set_page_metadata("teams")

    @teams = Team.published

    add_home_breadcrumb
    add_breadcrumb("teams")

  end

  def show

  end
end