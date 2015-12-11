class AddColumnsToTeams < ActiveRecord::Migration
  def change
    change_table :teams do |t|
      t.attachment :background_image

      t.attachment :section_1_image
      t.text :section_1_header
      t.text :section_1_description

      t.attachment :section_2_image
      t.text :section_2_image_description

      t.string :section_3a_background
      t.text :section_3a_description
      t.attachment :section_3a_image

      t.string :section_3b_background
      t.text :section_3b_description
      t.attachment :section_3b_image

      t.attachment :section_4_image
      t.text :section_4_image_description

      t.text :section_5_description
      t.text :section_5_quote
    end
  end
end
