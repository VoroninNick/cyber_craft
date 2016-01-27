class AddIsNewToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :featured, :boolean
  end
end
