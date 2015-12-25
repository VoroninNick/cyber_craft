class CreateProcessSteps < ActiveRecord::Migration
  def change
    create_table :process_steps do |t|
      t.boolean :published
      t.string :name
      t.integer :position
      t.text :description
      t.attachment :icon

      t.timestamps null: false
    end
  end
end
