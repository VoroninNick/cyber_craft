class AddPopularityPositionToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :popularity_position, :integer
  end
end
