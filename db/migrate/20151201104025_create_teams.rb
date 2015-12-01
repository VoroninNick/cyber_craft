class CreateTeams < ActiveRecord::Migration
  def up
    Team.create_article_table
  end

  def down
    Team.drop_article_table
  end
end
