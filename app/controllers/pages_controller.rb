class PagesController < ApplicationController
  before_action :set_page_instance, except: [:under_construction, :index, :process_page]

  def under_construction
    render layout: "under_construction"
  end

  def index
    set_page_metadata("home")
    @footer = false
    @blog_articles = BlogArticle.published.home_articles
    @industries = Industry.published
    @feedbacks = Feedback.all.order("id desc")
    @teams = Team.published
  end

  def about_us
    @members = Member.published.sort_by_sorting_position
  end

  def contacts
    set_page_metadata("contacts")

    add_home_breadcrumb
    add_breadcrumb("contacts")
  end

  def process_page
    set_page_metadata("process")
  end



  def terms_of_use
    add_home_breadcrumb
    add_breadcrumb("terms_of_use")

    @read_also_entries = %w(privacy_policy)

    render_text_page
  end

  def privacy_policy
    add_home_breadcrumb
    add_breadcrumb("privacy_policy")

    @read_also_entries = %w(terms_of_use)

    render_text_page
  end

  def career
    @footer = false
    @members = Member.published.sort_by_sorting_position
  end

  def sitemap
    add_home_breadcrumb
    add_breadcrumb("sitemap")
  end


  def set_page_instance
    set_page_metadata(action_name)
  end

  def render_text_page
    render template: "layouts/text_page", layout: false
  end
end