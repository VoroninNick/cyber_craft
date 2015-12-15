class CreateVacancyRequests < ActiveRecord::Migration
  def change
    create_table :vacancy_requests do |t|
      t.string :name
      t.string :email
      t.string :desired_position
      t.text :message
      t.attachment :cv

      t.timestamps null: false
    end
  end
end
