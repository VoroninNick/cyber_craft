class Team < ActiveRecord::Base
  extend Enumerize

  include BaseIndustry::InstanceMethods

  has_navigation


  before_validation :initialize_name_tag
  def initialize_name_tag
    self.name_tag = :h1 if self.name_tag.blank?
  end

  %w(section_3a_background section_3b_background).each do |c|
    enumerize c.to_sym, in: [:none, :gray_pattern], default: :none
  end


  acts_as_article

  has_cache
  def cache_instances
    [Pages.home, Pages.teams, self.class.all]
  end



  scope :sort_by_position, -> { order("position asc") }



  def cache_dependencies
    [Pages.home, Pages.teams]
  end

  def other(target = nil)
    target ||= self
    if !target.is_a?(Array)
      target = [target]
    end

    self.class.where.not(id: target.map(&:id))
  end


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


  def section_1?
    section_1_image.exists? && section_1_description.present?
  end

  def section_2?
    section_2_image.exists?
  end

  def section_3a?
    section_3a_image.exists? && section_3a_description.present?
  end

  def section_3b?
    section_3b_image.exists? && section_3b_description.present?
  end

  def section_4?
    section_4_image.exists?
  end

  def section_5?
    section_5_description.present?
  end

  def section_3a_background_gray_pattern?
    section_3a_background == "gray_pattern"
  end

  def section_3b_background_gray_pattern?
    section_3b_background == "gray_pattern"
  end
end