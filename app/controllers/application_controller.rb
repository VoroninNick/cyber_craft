require Rails.root.join("app/helpers/meta_data_helper.rb").to_s

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception


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

  def render_not_found
    render template: "errors/not_found"
  end
end
