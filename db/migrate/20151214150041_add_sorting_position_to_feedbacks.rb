class AddSortingPositionToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :sorting_position, :integer
  end
end
