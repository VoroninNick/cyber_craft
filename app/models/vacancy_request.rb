class VacancyRequest < ActiveRecord::Base
  attr_accessible *attribute_names

  has_attached_file :cv
  do_not_validate_attachment_file_type :cv
  attr_accessible :cv

end
