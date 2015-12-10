class AddFieldsToIndustries < ActiveRecord::Migration
  def change
    change_table :industries do |t|


      # section 1
      t.has_attached_file :background_image
      t.text :h1_text
      t.text :section_1_text
      t.has_attached_file :section_1_image

      # section 2
      t.text :section_2_description
      t.has_attached_file :section_2_image


      # section 3
      t.text :h2_text
      t.text :section_3_text
      t.text :section_3_quote

      # section 4
      t.has_attached_file  :section_4_image
      t.text :section_4_description_html

      # section 5
      t.has_attached_file  :section_5_image
      t.text :h3_text
      t.text :section_5_image_description
      t.text :section_5_text_html
    end  
  end
end
