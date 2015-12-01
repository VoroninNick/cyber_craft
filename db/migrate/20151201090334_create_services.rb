class CreateServices < ActiveRecord::Migration
  def up
    Service.create_article_table
  end

  def down
    Service.drop_article_table
  end
end
