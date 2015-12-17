class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :valid_authors, proc { where("name is not null and name<>'' ") }

  has_attached_file :avatar
  do_not_validate_attachment_file_type :avatar
  attr_accessible :avatar
  allow_delete_attachment :avatar

  #has_many :articles, class_name: BlogArticle, foreign_key: :author_id

  has_and_belongs_to_many :articles, class_name: BlogArticle, join_table: :author_articles, foreign_key: :author_id, association_foreign_key: :article_id
  attr_accessible :articles, :article_ids
end
