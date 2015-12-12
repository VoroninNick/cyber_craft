class BlogArticle < ActiveRecord::Base
  acts_as_article(tags: true, initialize_all_attachments: false)

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
end