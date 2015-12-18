class AddViewsToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :views, :integer
  end
end
