class AddNameTagToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :name_tag, :string
  end
end
