class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.has_attached_file :company_image
      t.has_attached_file :user_image
      t.text :comment

      t.timestamps null: false
    end
  end
end
