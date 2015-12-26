class AddNameTagToIndustries < ActiveRecord::Migration
  def change
    add_column :industries, :name_tag, :string
  end
end
