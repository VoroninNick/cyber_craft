class Industry < ActiveRecord::Base
  acts_as_article(base_articles: BaseArticles)

  [:index_logo].each do |attachment_name|
    has_attached_file attachment_name, styles: {home_logo: "1000x600#" }
    do_not_validate_attachment_file_type attachment_name
    attr_accessible attachment_name
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
end
