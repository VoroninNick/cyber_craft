class AddShortDescriptionToBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :short_description, :string
  end
end
