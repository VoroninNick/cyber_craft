class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible *attribute_names

  scope :valid_authors, proc { where("users.name is not null and users.name<>'' ") }

  scope :authors_with_articles, proc { joins(:articles).where(blog_articles: { published: 't' } ).uniq }

  has_attached_file :avatar, styles: { small: "80x80#" }
  do_not_validate_attachment_file_type :avatar
  attr_accessible :avatar
  allow_delete_attachment :avatar

  #has_many :articles, class_name: BlogArticle, foreign_key: :author_id

  has_and_belongs_to_many :articles, class_name: BlogArticle, join_table: :author_articles, foreign_key: :author_id, association_foreign_key: :article_id
  attr_accessible :articles, :article_ids

  def self.generate_authors!(count = 20)


    count.times{
      generate_author!()
    }
  end

  def self.generate_author!(*args)
    generate_author(*args).save
  end

  def self.generate_author()
    a = new
    a.name = FFaker::Name.name
    a.email = FFaker::Internet.email
    a.password = "12345678"
    a.password_confirmation = a.password

    a
  end
end
