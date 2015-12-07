class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :attachable_type
      t.integer :attachable_id
      t.has_attached_file :image
      t.text :description
      t.string :link
    end
  end
end
