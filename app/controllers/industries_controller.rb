class IndustriesController < BaseIndustriesController
  caches_page :index, :show

  def index
    set_page_metadata("industries")

    @industries = Industry.published.sort_by_position


    add_home_breadcrumb
    add_breadcrumb("industries")
  end

  def show
    @industry = Industry.published.where(url_fragment: params[:id]).first
    if @industry
      set_page_metadata(@industry)

      #@og_image = @industry.avatar.url


      add_home_breadcrumb
      add_breadcrumb("industries")
      add_breadcrumb(@industry.name, false)

      init_icons
      init_articles_navigation
    else
      render_not_found
    end
  end

  def resource_class
    Industry
  end

  def resource
    @industry
  end

  def resources
    @industries
  end
end