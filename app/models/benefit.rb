class Benefit < ActiveRecord::Base
  attr_accessible *attribute_names

  scope :published, -> { where(published: 't') }
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_attached_file :icon
  do_not_validate_attachment_file_type :icon
  attr_accessible :icon


  has_attached_file :large_icon
  do_not_validate_attachment_file_type :large_icon
  attr_accessible :large_icon

  has_cache
  def cache_instances
    [Pages.home, Pages.benefits]
  end




  # def app_router
  #   AppRouter ||= nil
  #   if !defined?(AppRouter)
  #     AppRouter = Class.new(ActionController::Base)
  #     AppRouter.send :include, ActionDispatch::Routing::UrlFor
  #   end
  #
  #   AppRouter
  # end
  #
  # def url
  #   app_router.url_for(self)
  # end

  # def self.app_router
  #   @@_app_router ||= nil
  #   if !@@_app_router
  #     Cms::AppRouter.send :include, Rails.application.routes.url_helpers
  #     @@_app_router = Cms::AppRouter.new
  #   end
  #
  #   @@_app_router
  #
  #
  # end

  # def route_name(action = :show)
  #   basic_route_name = self.class.name.demodulize.underscore
  #   if action == :show
  #
  #   end
  #
  #   return basic_route_name
  # end
  #
  # def url(action = :show)
  #   route = Rails.application.routes.named_routes[route_name]
  #   req_parts = route.required_parts
  #   built_parts = {}
  #   req_parts.each do |part|
  #     if part == :id
  #       built_parts[part] = self.to_param
  #     else
  #       if self.respond_to?(part)
  #         built_parts[part] = self.send(part)
  #       end
  #     end
  #   end
  #
  #   Rails.application.routes.url_helpers.send("#{route_name}_path", built_parts)
  # end
end
