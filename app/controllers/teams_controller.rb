class TeamsController < BaseIndustriesController
  caches_page :index, :show

  def index
    set_page_metadata("teams")


    @teams = Team.published.sort_by_position

    add_home_breadcrumb
    add_breadcrumb("teams")


  end

  def show
    @team = Team.published.where(url_fragment: params[:id]).first
    if @team
      set_page_metadata(@team)
      #@og_image = @team.avatar.url

      add_home_breadcrumb
      add_breadcrumb("teams")
      add_breadcrumb(@team.name, false)

      init_icons
      init_articles_navigation
    else
      render_not_found
    end
  end

  def resource_class
    Team
  end

  def resource
    @team
  end

  def resources
    @industries
  end
end