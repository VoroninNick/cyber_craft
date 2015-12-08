class AddBannerToIndustries < ActiveRecord::Migration
  def change
    change_table :industries do |t|
      t.has_attached_file :banner
    end
  end
end
