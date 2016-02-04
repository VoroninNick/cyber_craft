class HomeBlogArticle < BlogArticle
  default_scope {
    home_articles
  }

  def cache_instances
    instances = super
    if home_position_changed? || !self.persisted?
      instances += [Pages.home]
    end

    instances
  end
end