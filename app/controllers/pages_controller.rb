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

    @members = [
        {
            image: "/assets/team1.jpg",
            hover_image: "/assets/team1-hover.jpg",
            description: "<p>Inspirational leader</p><p>People management guru</p><p>Business idea generator</p>",
            name: "Eugene Safronov",
            position: "СЕО, Founder",
            facebook: "",
            linkedin: ""
        },
        {
            image: "/assets/team2.jpg",
            hover_image: "/assets/team2-hover.jpg",
            description: "<p>Strategic thinker</p><p>Business advisor</p><p>Client-employee relations mediator</p>",
            name: "Vlada Piddubna",
            position: "HR Business Partner",
            facebook: "",
            linkedin: ""
        },
        {
            image: "/assets/team3.jpg",
            hover_image: "/assets/team3-hover.jpg",
            description: "<p>Talent acquisition expert</p><p>People-lover</p><p>Happiness-maker</p>",
            name: "Violetta Yehorova",
            position: "HR Generalist",
            facebook: "",
            linkedin: ""
        }
    ]

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

  def set_page_instance
    set_page_metadata(action_name)
  end

  def terms_of_use

  end

  def privacy_policy

  end

  def career
    @footer = false
  end

  def sitemap

  end
end