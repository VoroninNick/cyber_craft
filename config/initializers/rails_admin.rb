require_relative "require_libs"

def future_navigation_label
  navigation_label do
    "Future"
  end
end

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end




  config.included_models += [FormConfig, FormConfigs::Message, Message, User, Pages::Home]

  config.included_models += [Cms::MetaTags]

  config.included_models += [BlogArticle, Service, Team, Industry, Feedback]

  config.included_models += [FileEditor]



  config.model Pages::Home do
    field :seo_tags
  end

  config.model Cms::MetaTags do
    field :title
    field :keywords
    field :description
  end

  config.model BlogArticle do
    field :published
    field :name
    field :url_fragment
    field :content
    field :avatar
    field :tag_list do
     # partial 'tag_list_with_suggestions'


    end
    field :author_name
  end


  config.model Industry do
    field :published
    field :name
    field :short_description
    field :content, :ck_editor
    #field :avatar
    field :index_logo do
      label "image"
      help ""
    end
    field :seo_tags

  end

  config.model Feedback do
    field :name
    field :company_image
    field :user_image
    field :comment
  end

  config.model FormConfig do
    future_navigation_label
  end

  config.model FormConfigs::Message do
    future_navigation_label
  end

  config.model Message do
    future_navigation_label
  end

  config.model Service do
    future_navigation_label
  end

  config.model Team do
    future_navigation_label
  end

  config.model Cms::MetaTags do
    future_navigation_label
  end

end
