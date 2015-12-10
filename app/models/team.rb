class Team < ActiveRecord::Base
  extend Enumerize

  enumerize :section_3_background, in: [:none, :white, :gray_pattern], default: :none

  acts_as_article

  scope :sort_by_position, -> { order("position asc") }

  has_attached_file :banner
  do_not_validate_attachment_file_type :banner
  attr_accessible :banner


  has_attached_file :background_image
  has_attached_file :section_2_image
  has_attached_file :section_3_image
  has_attached_file :section_4_image


  %w(background_image section_2_image section_3_image section_4_image).each do |k|
    do_not_validate_attachment_file_type k
    attr_accessible k
  end
end