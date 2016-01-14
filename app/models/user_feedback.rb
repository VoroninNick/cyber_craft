class UserFeedback < Feedback
  def cache_instances
    [Pages.home]
  end
end