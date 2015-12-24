class Benefit < ActiveRecord::Base
  attr_accessible *attribute_names

  scope :published, -> { where(published: 't') }
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_attached_file :icon
  do_not_validate_attachment_file_type :icon
  attr_accessible :icon


  has_attached_file :large_icon
  do_not_validate_attachment_file_type :large_icon
  attr_accessible :large_icon

end
