class CreateHomeArticleLinks < ActiveRecord::Migration
  def change
    create_table :home_article_links do |t|
      t.integer :page_id
      t.integer :article_id
    end
  end
end
