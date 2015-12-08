class AddBottomBannerToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.has_attached_file :bottom_banner
    end
  end
end
