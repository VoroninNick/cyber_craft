class AddPositionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :position, :integer
  end
end
