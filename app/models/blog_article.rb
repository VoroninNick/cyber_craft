class BlogArticle < ActiveRecord::Base
  acts_as_article(tags: true, initialize_all_attachments: false, author: false)

  has_and_belongs_to_many :authors, class_name: User, join_table: :author_articles, foreign_key: :article_id, association_foreign_key: :author_id
  attr_accessible :authors, :author_ids

  has_attached_file :avatar, styles: { home: "720x450#" }

  [:avatar].each do |attachment_name|

    do_not_validate_attachment_file_type attachment_name
    attr_accessible attachment_name

    allow_delete_attachment attachment_name
  end

  scope :home_articles, -> { last(3) }




  def article_date
    d = updated_at

    "#{d.day} #{Date::MONTHNAMES[d.month].downcase} #{d.year}"
  end

  def self.sorting_properties
    [:popularity, :date, :name, :author]
  end

  def self.generate_articles!(count = 100)
    tags = 20.times.map{Faker::Lorem.word}
    author_names = 20.times.map{FFaker::Name.name}

    count.times{
      generate_article!(tags, author_names)
    }
  end

  def self.generate_article!(*args)
    generate_article(*args).save
  end

  def self.generate_article(tags, author_names)
    a = new
    a.name = FFaker::Name.name
    a.published = true
    a.tag_list = rand(1..5).times.map{ tags.sample }
    a.author_name = author_names.sample

    a
  end

  def author_ids
    ids = []
    if author_id
      ids << author_id
    end

    ids
  end

  def author_names
    if author
      return author.pluck(:name)
    else
      return []
    end
  end
end