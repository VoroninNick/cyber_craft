class AddBannerToBlogArticles < ActiveRecord::Migration
  def change
    change_table :blog_articles do |t|
      t.attachment :banner
    end
  end
end
