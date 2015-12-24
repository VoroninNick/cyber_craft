class AddLargeIconToBenefits < ActiveRecord::Migration
  def change
    change_table :benefits do |t|
      t.attachment :benefits, :large_icon
    end
  end
end
