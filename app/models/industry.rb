class Industry < ActiveRecord::Base
  acts_as_article(base_articles: BaseArticles)

  [:index_logo].each do |attachment_name|
    has_attached_file attachment_name, styles: {home_logo: "940x470#" }
    do_not_validate_attachment_file_type attachment_name
    attr_accessible attachment_name
  end
end
