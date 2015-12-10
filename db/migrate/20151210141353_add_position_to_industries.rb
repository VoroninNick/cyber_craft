class AddPositionToIndustries < ActiveRecord::Migration
  def change
    add_column :industries, :position, :integer
  end
end
