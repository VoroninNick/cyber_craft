class CreateIndustries < ActiveRecord::Migration
  def up
    Industry.create_article_table
  end

  def down
    Industry.drop_article_table
  end
end
