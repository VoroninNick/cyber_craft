class Pages::Home < Cms::Page
  has_cache

  has_many :home_article_links, foreign_key: :page_id
  has_many :articles, through: :home_article_links, class_name: BlogArticle, :source => :article, foreign_key: "page"

  attr_accessible :articles, :article_ids

  #depends_on :benefit, :blog_article





  def route_name
    "root"
  end


end