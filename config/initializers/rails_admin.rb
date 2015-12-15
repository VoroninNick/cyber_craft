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

def feedbacks_navigation_label
  navigation_label do
    "Feedbacks"
  end
end

def help_html_code
  help "html code"
end

def ck_editor_field(name, &block)
  field name, :ck_editor do
    def value
      bindings[:object].send(name)
    end
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

  page_model_names = %w(AboutUs Blog Career Contacts Home Industries PrivacyPolicy Process Services Sitemap Teams TermsOfUse).map{|s| "Pages::#{s}" }

  only_configurable_models = [FormConfigs::Message, FormConfigs::VacancyRequest, *page_model_names]

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

    nestable do
      only [Industry, Team, Member, Benefit, UserFeedback, EmployeeFeedback]
    end
  end




  config.included_models += [FormConfig, FormConfigs::Message, FormConfigs::VacancyRequest, Message, User]

  config.included_models += page_model_names

  config.included_models += [Cms::MetaTags]

  config.included_models += [BlogArticle, Service, Team, Industry, Feedback, UserFeedback, EmployeeFeedback]

  config.included_models += [FileEditor]

  config.included_models += [Member, Benefit]




  config.model Pages::Home do
    pages_navigation_label

    field :seo_tags
  end

  config.model Pages::Industries do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::AboutUs do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      field :seo_tags
    end
  end



  config.model Pages::Teams do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::Career do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      field :seo_tags
    end
  end

  config.model Pages::Blog do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      field :seo_tags
    end
  end

  config.model Pages::Contacts do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      field :seo_tags
    end
  end

  config.model Pages::PrivacyPolicy do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description

      ck_editor_field(:content)

      field :seo_tags
    end
  end

  config.model Pages::Process do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      #field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::Services do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      #field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::Sitemap do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description
      #field :intro, :ck_editor
      field :seo_tags
    end
  end

  config.model Pages::TermsOfUse do
    pages_navigation_label

    edit do
      field :banner
      field :bottom_banner
      field :bottom_banner_description

      ck_editor_field(:content)
      field :seo_tags
    end
  end



  config.model BlogArticle do
    edit do
      field :published
      field :name
      field :url_fragment
      field :content, :ck_editor
      field :avatar
      field :tag_list do
      #  partial 'tag_list_with_suggestions'
        def value
          bindings[:object].send(name).to_s
        end
      end
      field :author_name
    end

    list do
      field :published
      field :name
      field :avatar
    end
  end


  config.model Industry do
    nestable_list true

    group :main do
      field :published
      field :name
      field :url_fragment
      field :short_description
      #field :content, :ck_editor
      field :avatar
      field :index_logo do
        label "image"
        help ""
      end
      field :banner
    end

    group :content do
      field :background_image

      field :section_1_image
      field :h1_text do
        label "section 1 header"
      end
      field :section_1_text do
        help_html_code
      end

      field :section_2_image
      field :section_2_description do
        help_html_code
      end

      field :h2_text do
        label "section 3 header"
      end
      field :section_3_text do
        help_html_code
      end
      field :section_3_quote

      field :section_4_image
      field :section_4_description_html do
        help_html_code
      end

      field :h3_text do
        label "section 5 header"
      end
      field :section_5_image
      field :section_5_image_description

      field :section_5_text_html do
        help_html_code
      end
    end

    group :seo do
      field :seo_tags
    end
  end

  config.model Team do
    nestable_list true

    group :main do
      field :published
      field :name
      field :url_fragment
      field :avatar
      field :banner

    end

    group :content do
      field :background_image

      field :section_1_image
      field :section_1_header
      field :section_1_description

      field :section_2_image
      field :section_2_image_description

      field :section_3a_background
      field :section_3a_description
      field :section_3a_image

      field :section_3b_background
      field :section_3b_description
      field :section_3b_image

      field :section_4_image
      field :section_4_image_description

      field :section_5_description
      field :section_5_quote
    end

    group :seo do
      field :seo_tags
    end

  end

  config.model Feedback do
    visible false
  end


  config.model UserFeedback do
    nestable_list position_field: :sorting_position
    feedbacks_navigation_label

    field :name
    field :company_image
    field :user_image
    field :comment
  end


  config.model EmployeeFeedback do
    nestable_list position_field: :sorting_position
    feedbacks_navigation_label

    field :name
    field :user_image
    field :position
    field :comment


  end

  config.model FormConfig do
    visible false
  end

  [FormConfigs::Message, FormConfigs::VacancyRequest].each do |m|
    config.model m do
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

  config.model Cms::MetaTags do
    visible false

    field :title
    field :keywords
    field :description
  end


  config.model Member do
    nestable_list position_field: :sorting_position

    field :published
    field :image
    field :hover_image

    field :name
    field :description
    field :position
    field :facebook
    field :linkedin
  end

  config.model Benefit do
    nestable_list position_field: :sorting_position

    edit do
      field :published
      field :name
      field :description
    end
  end


end
