class Pages::Contacts < Cms::Page
  has_html_block :phones
  has_html_block :email
  has_html_block :skype
  has_html_block :address
  has_cache

  # def email
  #   res = super
  #   res = "info@cybercraftinc.com" if res.blank?
  #
  #   res
  # end
  #
  # def skype
  #   res = super
  #   res = "ask.CyberCraft" if res.blank?
  #
  #   res
  # end
  #
  # def address
  #   res = super
  #   res = "<span>7 Slipoho Str.</span><span>Lviv, Ukraine, 79017</span>" if res.blank?
  #
  #   res
  # end


  def cache_instances
    [*Pages.all_instances, *([BlogArticle, Industry, Team].map{|p| p.all })]
  end
end


