class AddBannerToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.has_attached_file :banner
    end
  end
end
