class Pages::Career < Cms::Page
  has_html_block :career_site_date

  def career_site_date_time
    if career_site_date.blank?
      return nil
    end
    DateTime.parse(career_site_date)
  end
end