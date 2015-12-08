module NavigationHelper
  def menu(menu_keys = nil, i18n_root = "menu")
    h = {}
    menu_keys ||= %w(about_us services process benefits teams industries blog contacts)
    menu_keys.each do |key|
      name = I18n.t("#{i18n_root}.#{key}")
      url = send("#{key}_path")
      #active = params[:route_name].to_s == key
      active = controller_name == key || (action_name == key && controller_name == "pages") || params[:route_name].to_s == key
      h[key.to_sym] = { name: name, url: url, active: active }

    end

    h
  end

  def footer_menu
    menu
  end

  def additional_links
    menu(%w(terms_of_use privacy_policy career sitemap), "additional_links")
  end
end