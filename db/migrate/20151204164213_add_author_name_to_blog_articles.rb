class AddAuthorNameToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :author_name, :string
  end
end
