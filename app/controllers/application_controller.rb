require Rails.root.join("app/helpers/meta_data_helper.rb").to_s

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_action do
    SHOW_ALL = !request.host.scan(/cybercraft/).any?
  end


  include ActionView::Helpers::OutputSafetyHelper
  include ActionView::Helpers::AssetUrlHelper
  include PagesHelper
  #include SeoTagsHelper
  include MetaDataHelper
  include NavigationHelper

  before_action do
    @_response.headers['Access-Control-Allow-Origin'] = '*'
    @_response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    @_response.headers['Access-Control-Request-Method'] = '*'
    @_response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end



  before_action :initialize_breadcrumbs

  def render_not_found
    render template: "errors/not_found"
  end


  def initialize_breadcrumbs
    @_breadcrumbs = []
  end

  def add_breadcrumb(name, url = nil)
    b = { }
    b[:name] = (I18n.t("breadcrumbs.#{name}", raise: true) rescue name)
    b[:url] = url || send("#{name}_path")
    @_breadcrumbs << b
  end

  def add_home_breadcrumb
    add_breadcrumb("Home", root_path)
  end



  def render_breadcrumbs
    raw(render_to_string partial: "breadcrumbs")
  end

  def render_page_banner
    raw(render_to_string(partial: "page_banner"))
  end

  helper_method :render_breadcrumbs
  helper_method :render_page_banner


end
