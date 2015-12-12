class Benefit < ActiveRecord::Base
  attr_accessible *attribute_names

  scope :published, -> { where(published: 't') }
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }


end
