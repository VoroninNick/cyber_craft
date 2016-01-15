class Pages::AboutUs < Cms::Page
  has_html_block :content

  has_html_block :we_are
  has_html_block :team_header
  has_html_block :our_location

  has_cache

end