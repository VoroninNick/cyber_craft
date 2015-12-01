class CreateSeoTags < ActiveRecord::Migration
  def change
    create_table :seo_tags do |t|
      t.string :page_type
      t.integer :page_id
      t.string :title
      t.text :keywords
      t.text :description
    end
  end
end
