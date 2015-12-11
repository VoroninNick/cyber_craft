class Team < ActiveRecord::Base
  extend Enumerize

  %w(section_3a_background section_3b_background).each do |c|
    enumerize c.to_sym, in: [:none, :gray_pattern], default: :none
  end


  acts_as_article

  scope :sort_by_position, -> { order("position asc") }

  has_attached_file :banner
  do_not_validate_attachment_file_type :banner
  attr_accessible :banner
  allow_delete_attachment :banner


  has_attached_file :background_image
  has_attached_file :section_1_image
  has_attached_file :section_2_image
  has_attached_file :section_3a_image
  has_attached_file :section_3b_image
  has_attached_file :section_4_image


  %w(background_image section_1_image section_2_image section_3a_image section_3b_image section_4_image).each do |k|
    do_not_validate_attachment_file_type k
    attr_accessible k, "#{k}_delete"

    allow_delete_attachment(k)
  end
end