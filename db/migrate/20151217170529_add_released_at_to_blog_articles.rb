class AddReleasedAtToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :released_at, :datetime
  end
end
