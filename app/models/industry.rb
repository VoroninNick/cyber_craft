class Industry < ActiveRecord::Base
  acts_as_article(base_articles: BaseArticles)
end
