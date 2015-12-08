require_relative "require_libs"

def future_navigation_label
  navigation_label do
    "Future"
  end
end

def settings_navigation_label
  navigation_label do
    "Settings"
  end
end

def pages_navigation_label
  navigation_label do
    "Pages"
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

  page_model_names = %w(AboutUs Blog Career Contacts Home Industries PrivacyPolicy Process Services Teams TermsOfUse).map{|s| "Pages::#{s}" }

  only_configurable_models = [FormConfigs::Message, *page_model_names]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except only_configurable_models
    end
    export
    bulk_delete
    show do
      except only_configurable_models
    end
    edit
    delete do
      except only_configurable_models
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end




  config.included_models += [FormConfig, FormConfigs::Message, Message, User]

  config.included_models += page_model_names

  config.included_models += [Cms::MetaTags]

  config.included_models += [BlogArticle, Service, Team, Industry, Feedback]

  config.included_models += [FileEditor]



  config.model Pages::Home do
    pages_navigation_label

    field :seo_tags
  end

  config.model Pages::Industries do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::AboutUs do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :seo_tags
    end
  end



  config.model Pages::Teams do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::Career do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :seo_tags
    end
  end

  config.model Pages::Blog do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :seo_tags
    end
  end

  config.model Pages::Contacts do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :seo_tags
    end
  end

  config.model Pages::PrivacyPolicy do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :seo_tags
    end
  end

  config.model Pages::Process do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      #field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::Services do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      #field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::TermsOfUse do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :seo_tags
    end
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
    field :avatar
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
    visible false
  end

  config.model FormConfigs::Message do
    settings_navigation_label
    show do
      field :email_receivers, :text
    end

    edit do
      field :email_receivers do
        help do
          "Please type each email in new line"
        end
      end
    end
  end

  config.model Message do

  end

  config.model Service do
    edit do
      field :published
      field :name
      field :short_description
      field :avatar
    end
  end

  config.model Team do
    field :published
    field :name
    field :avatar
  end

  config.model Cms::MetaTags do
    visible false

    field :title
    field :keywords
    field :description
  end





end
