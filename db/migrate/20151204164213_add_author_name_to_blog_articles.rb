class AddAuthorNameToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :article_name, :string
  end
end
