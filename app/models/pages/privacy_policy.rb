class Pages::PrivacyPolicy < Cms::Page
  has_html_block :content
  cacheable
end