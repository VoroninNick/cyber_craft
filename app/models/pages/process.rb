class Pages::Process < Cms::Page
  has_html_block :content
  has_html_block :intro
  cacheable
end