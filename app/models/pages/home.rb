class Pages::Home < Cms::Page
  has_cache

  #has_many :articles, -> { BlogArticle.limit(3) }, class_name: BlogArticle

  #depends_on :benefit, :blog_article

  def route_name
    "root"
  end


end