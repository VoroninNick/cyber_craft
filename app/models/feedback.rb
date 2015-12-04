class Feedback < ActiveRecord::Base
  attr_accessible *attribute_names

  has_attached_file :user_image, styles: { home: "80x80#" }
  has_attached_file :company_image, styles: { home: "80x40#" }

  [:company_image, :user_image].each do |attachment_name|

    do_not_validate_attachment_file_type attachment_name
    attr_accessible attachment_name
  end
end
