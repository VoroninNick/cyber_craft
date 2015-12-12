class BlogController < ApplicationController
  def index
    @available_tags = []
    @available_authors = []

    set_page_metadata("blog")

    add_home_breadcrumb
    add_breadcrumb("blog")

    @articles = BlogArticle.published

    @tags = BlogArticle.published.tag_counts_on(:tags)

    @author_names = BlogArticle.published.pluck(:author_name).uniq.select(&:present?)

    @total_articles = BlogArticle.published.count



  end

  def show
    @article = BlogArticle.published.where(url_fragment: params[:id]).first
    if @article
      set_page_metadata(@article)

      add_home_breadcrumb
      add_breadcrumb("blog")
      add_breadcrumb(@article.name, false)

      @related_articles = BlogArticle.published.limit(3)

      #init_articles_navigation
    else
      render_not_found
    end
  end
end