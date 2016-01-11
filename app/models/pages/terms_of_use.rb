class Pages::TermsOfUse < Cms::Page
  has_html_block :content
  cacheable
end