class Service < ActiveRecord::Base
  acts_as_article

  has_cache
  def cache_instances
    [Pages.home, Pages.services]
  end

end


