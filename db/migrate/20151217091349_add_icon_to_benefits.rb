class AddIconToBenefits < ActiveRecord::Migration
  def change
    change_table :benefits do |t|
      t.attachment :icon
    end
  end
end
