class Pages::Process < Cms::Page
  has_html_block :content
  has_html_block :intro
  has_cache
end