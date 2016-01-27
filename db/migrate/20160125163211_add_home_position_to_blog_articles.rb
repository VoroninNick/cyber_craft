class AddHomePositionToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :home_position, :integer
  end
end
