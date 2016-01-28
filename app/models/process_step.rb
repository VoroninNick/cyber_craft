class ProcessStep < ActiveRecord::Base
  attr_accessible *attribute_names

  scope :published, -> { where(published: 't') }
  scope :sort_by_sorting_position, -> { order("position asc") }

  has_attached_file :icon
  do_not_validate_attachment_file_type :icon
  attr_accessible :icon


  has_cache
  def cache_instances
    [Pages.process]
  end
end
