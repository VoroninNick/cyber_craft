class Message < ActiveRecord::Base
  attr_accessible *attribute_names

  validates :name, :email, presence: true
end
