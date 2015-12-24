class CreateCmsTables < ActiveRecord::Migration
  def up
    Cms.create_tables(only: :html_blocks)
  end

  def down
    Cms.drop_tables(only: :html_blocks)
  end
end
