class AddPositionToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :position, :string
  end
end
