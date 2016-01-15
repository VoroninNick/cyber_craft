class BlogArticle < ActiveRecord::Base
  acts_as_article(tags: true, initialize_all_attachments: false, author: false)

  has_cache
  def cache_instances
    public_fields = [:tags, :authors, :name, :url_fragment, :avatar, :released_at]
    excepted_fields = [:views]
    any_public_field_changed = public_fields.map{|f| method = "#{f}_changed?"; self.respond_to?(method) && send(method) }.select(&:present?).any?
    if any_public_field_changed
      [Pages.home, Pages.blog, self.class.all]
    else
      [self]
    end
  end

  has_and_belongs_to_many :authors, class_name: User, join_table: :author_articles, foreign_key: :article_id, association_foreign_key: :author_id
  attr_accessible :authors, :author_ids

  has_attached_file :avatar, styles: { home: "720x450#" }
  has_attached_file :banner


  [:avatar, :banner].each do |attachment_name|

    do_not_validate_attachment_file_type attachment_name
    attr_accessible attachment_name

    allow_delete_attachment attachment_name
  end

  scope :home_articles, -> { last(3) }

  scope :sort_by_popularity_asc, proc { order "views asc" }
  scope :sort_by_popularity_desc, proc { order "views desc" }

  scope :sort_by_date_asc, proc { order "released_at asc" }
  scope :sort_by_date_desc, proc { order "released_at desc" }

  scope :sort_by_name_asc, proc { order "name asc" }
  scope :sort_by_name_desc, proc { order "name desc" }

  #scope :sort_by_author, proc {|direction = :asc| joins(:authors).order("authors.name #{direction}").uniq }




  before_save do
    self.released_at ||= created_at
  end

  def article_date
    d = released_at

    "#{d.day} #{Date::MONTHNAMES[d.month].downcase} #{d.year}"

  end

  def self.sorting_properties
    #[:popularity, :date, :name, :author]
    [:popularity, :date, :name]
  end

  def self.generate_articles!(count = 100)


    tags = 20.times.map{Faker::Lorem.word}
    author_ids = User.valid_authors.pluck(:id)


    count.times{
      generate_article!(tags, author_ids)
    }
  end

  def self.generate_article!(*args)
    generate_article(*args).save
  end

  def self.generate_article(tags, author_ids)
    a = new
    a.name = FFaker::Name.name
    a.published = true
    a.tag_list = rand(1..5).times.map{ tags.sample }
    a.author_ids = rand(1..3).times.map{author_ids.sample}

    a
  end

  # def author_ids
  #   ids = []
  #   if author_id
  #     ids << author_id
  #   end
  #
  #   ids
  # end

  def author_names
    # if author
    #   return author.pluck(:name)
    # else
    #   return []
    # end

    authors.pluck(:name)
  end

end