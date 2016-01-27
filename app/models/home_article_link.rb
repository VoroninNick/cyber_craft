class HomeArticleLink < ActiveRecord::Base
  attr_accessible *attribute_names
  belongs_to :page, class_name: Pages::Home, foreign_key: "page_id"
  belongs_to :article, class_name: BlogArticle, foreign_key: "article_id"

  attr_accessible :page, :article
end