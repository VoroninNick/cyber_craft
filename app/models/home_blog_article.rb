class HomeBlogArticle < BlogArticle
  default_scope {
    home_articles
  }

  def cache_instances
    instances = super
    if home_position_changed?
      instances += [Pages.home]
    end

    instances
  end
end