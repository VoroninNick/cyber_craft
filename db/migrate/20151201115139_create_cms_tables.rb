class CreateCmsTables < ActiveRecord::Migration
  def up
    Cms.create_tables
  end

  def down
    Cms.drop_tables
  end
end
