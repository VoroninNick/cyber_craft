class Team < ActiveRecord::Base
  acts_as_article

  has_attached_file :banner
  do_not_validate_attachment_file_type :banner
  attr_accessible :banner
end