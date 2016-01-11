class Pages::Career < Cms::Page
  has_html_block :career_site_date
  cacheable

  after_save do
    self.class.normalize_site_date
  end

  def career_site_date_time
    if career_site_date.blank?
      return nil
    end
    DateTime.parse(career_site_date)
  end


  def self.normalize_site_date
    require 'time_diff'

    reset_to = 15
    reset_when_less_than = 10

    p = Pages::Career.first_or_initialize
    end_date_time = p.career_site_date_time
    start_date_time = DateTime.now
    time_diff_components = Time.diff(start_date_time, end_date_time)
    day_diff = time_diff_components[:day]

    days = time_diff_components[:week] * 7 + time_diff_components[:day]

    if days < reset_when_less_than && time_diff_components[:month] == 0 && time_diff_components[:year] == 0
      p.career_site_date = (end_date_time + (reset_to - days))
    end
  end
end