class CreateRelatedBlogArticles < ActiveRecord::Migration
  def change
    create_table :related_blog_articles do |t|
      t.integer :article_id
      t.integer :related_article_id
    end
  end
end
