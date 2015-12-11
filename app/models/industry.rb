class Industry < ActiveRecord::Base
  acts_as_article(base_articles: BaseArticles)


  scope :sort_by_position, -> { order("position asc") }

  def self.home_logo_height
    550
  end

  [:index_logo].each do |attachment_name|
    has_attached_file attachment_name, styles: {home_logo: "1000x#{home_logo_height}#" }
    do_not_validate_attachment_file_type attachment_name
    attr_accessible attachment_name
  end

  has_attached_file :banner
  do_not_validate_attachment_file_type :banner
  attr_accessible :banner


  # content builder
  has_attached_file :background_image
  has_attached_file :section_1_image

  has_attached_file :section_2_image

  has_attached_file :section_4_image

  has_attached_file :section_5_image

  %w(background_image section_1_image section_2_image section_4_image section_5_image).each do |k|
    do_not_validate_attachment_file_type k
    attr_accessible k
    allow_delete_attachment
  end


  def self.reprocess_images!

    attachment_names = Industry.attachment_definitions.keys
    self.all.each do |item|
      attachment_names.each do |attachment_name|
        attachment = item.send(attachment_name)
        attachment.reprocess!
      end
    end
  end

  def background_image_url
    background_image_url.url
  end

  def h3_tag
    if h2_text.present?
      :h3
    else
      :h2
    end
  end
end
