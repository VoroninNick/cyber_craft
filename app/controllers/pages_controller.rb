class PagesController < ApplicationController
  before_action :set_page_instance, except: [:under_construction, :index, :process_page]
  before_action :add_home_breadcrumb, except: [:under_construction, :index, :career]
  before_action except: [:under_construction, :index, :process_page] do
    add_breadcrumb(action_name)
  end

  caches_page :index, :about_us, :contacts, :process_page, :terms_of_use, :privacy_policy, :career, :sitemap

  def under_construction
    render layout: "under_construction"
  end

  def index
    set_page_metadata("home")
    @footer = false
    @blog_articles = BlogArticle.published.home_articles
    @industries = Industry.published
    @feedbacks = UserFeedback.all.order("id desc")
    @teams = Team.published
    @benefits = Benefit.published.sort_by_sorting_position
  end

  def about_us
    @members = Member.published.sort_by_sorting_position
    #@page_banner_title ||= 'hi'
  end

  def contacts
  end

  def process_page
    set_page_metadata("process")

    add_breadcrumb("process")
  end



  def terms_of_use

    @read_also_entries = %w(privacy_policy)

    render_text_page
  end

  def privacy_policy

    @read_also_entries = %w(terms_of_use)

    render_text_page
  end

  def career
    @footer = false
    @members = Member.published.sort_by_sorting_position
    @feedbacks = EmployeeFeedback.all.order("id desc")
    @page_banner = false


  end

  def sitemap

  end


  def set_page_instance
    set_page_metadata(action_name)
  end

  def render_text_page
    render template: "layouts/text_page", layout: false
  end
end