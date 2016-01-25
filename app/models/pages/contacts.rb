class Pages::Contacts < Cms::Page
  has_html_block :phones
  has_cache


  def cache_instances
    [*Pages.all_instances, *([BlogArticle, Industry, Team].map{|p| p.all })]
  end
end


