class AddBannerToTeams < ActiveRecord::Migration
  def change
    change_table :teams do |t|
      t.has_attached_file :banner
    end
  end
end
