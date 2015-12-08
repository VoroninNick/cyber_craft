class AddBottomBannerDescriptionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :bottom_banner_description, :text
  end
end
