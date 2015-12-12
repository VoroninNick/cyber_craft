class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.boolean :published
      t.string :name
      t.text :description
      t.integer :sorting_position

      t.timestamps null: false
    end
  end
end
