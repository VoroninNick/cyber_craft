class Pages::Home < Cms::Page
  cacheable

  def route_name
    "root"
  end
end