class BlogArticle < ActiveRecord::Base
  acts_as_article(tags: true)

  scope :home_articles, -> { last(3) }




end