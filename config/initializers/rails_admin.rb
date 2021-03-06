skip_gems_with_assets = !!ENV['OAF']

if defined?(RailsAdmin) && !skip_gems_with_assets

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

  def content_field(name = :content, type = :ck_editor)
    field name, type do
      def value
        bindings[:object].send(name)
      end
    end
  end

  def slim_editor_field(name)
    field name, :text do
      def value
        bindings[:object].send(name)
      end
    end
  end

  def field_name_tag
    field :name_tag do
      help "tag for banner title. Default: h1. Type any valid html5 tag, e.g. h1, h2, h3, h4, h5, h6, div"
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

    page_model_names = %w(AboutUs Blog Benefits Career Contacts Home Industries PrivacyPolicy Process Services Sitemap Teams TermsOfUse).map{|s| "Pages::#{s}" }

    only_configurable_models = [FormConfigs::Message, FormConfigs::VacancyRequest, *page_model_names]
    read_only_models = [Message, VacancyRequest]

    config.actions do
      dashboard                     # mandatory
      index                         # mandatory
      new do
        except(only_configurable_models + read_only_models)
      end
      export
      bulk_delete
      show do
        except only_configurable_models
      end
      edit do
        except read_only_models
      end
      delete do
        except(only_configurable_models + read_only_models)
      end
      show_in_app do
        except read_only_models
      end

      ## With an audit adapter, you can add:
      # history_index
      # history_show

      nestable do
        only [Industry, Team, Member, Benefit, UserFeedback, EmployeeFeedback, ProcessStep, BlogArticle, HomeBlogArticle]

        template_name do
          "nestable_with_title"
        end
      end

      clear_cache do

      end
    end




    config.included_models += [Cms::FormConfig, FormConfigs::Message, FormConfigs::VacancyRequest, VacancyRequest, Message, User]

    config.included_models += page_model_names

    config.included_models += [Cms::MetaTags]

    config.included_models += [BlogArticle, HomeBlogArticle, Service, Team, Industry, Feedback, UserFeedback, EmployeeFeedback]

    config.included_models += [FileEditor]

    config.included_models += [Member, Benefit, ProcessStep]




    config.model Pages::Home do
      pages_navigation_label

      field :articles
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
        field :we_are, :ck_editor
        field :team_header, :ck_editor
        field :our_location, :ck_editor
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
        #field :banner
        #field :bottom_banner
        #field :bottom_banner_description
        field :career_site_date, :datetime do
          def value
            val = bindings[:object].send(:career_site_date)
            if val.present?
              return DateTime.parse(val)
            end

            return nil
          end
        end

        content_field :phone, :text
        content_field :email, :text
        content_field :address, :text
        field :seo_tags
      end
    end

    config.model Pages::Benefits do
      pages_navigation_label

      edit do
        field :banner
        field :bottom_banner
        field :bottom_banner_description
        #field :intro, :ck_editor
        content_field(:intro, :text)
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
        content_field :phones, :text
        content_field :email, :text
        content_field :skype, :text
        content_field :address, :text
        content_field :facebook_profile_url, :text
        content_field :linkedin_profile_url, :text
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
        content_field :intro, :text
        field :bottom_banner
        field :bottom_banner_description
        #field :intro, :ck_editor
        #slim_editor_field(:content)

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


    [BlogArticle, HomeBlogArticle].each do |m|
      config.model m do
        edit do
          field :published
          field :featured do
            label "New?"
          end
          field :name
          field :url_fragment
          field :content, :ck_editor
          field :avatar
          field :banner
          field :tag_list do
            def value
              bindings[:object].send(name).to_s
            end
          end
          #field :author_name
          field :authors do
            associated_collection_scope do
              proc do |scope|
                scope.valid_authors
              end
            end
          end

          field :released_at

          field :views do
            read_only true
          end

          field :related_articles

          field :seo_tags
        end

        if m == BlogArticle
          list do
            field :published
            field :name
            field :avatar
          end
        end

        if m == BlogArticle
          nestable_list position_field: :popularity_position, title: "Sorting by popularity by asceding"
        end

        if m == HomeBlogArticle
          nestable_list position_field: :home_position, title: "Sorting home articles by asceding"
        end
      end
    end


    config.model Industry do
      nestable_list true

      group :main do
        field :published
        field :name
        field_name_tag
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
        field_name_tag
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

    config.model Cms::FormConfig do
      visible false
    end

    config.model VacancyRequest do
      show do
        field :name
        field :email
        field :message
        field :cv
        field :linkedin_profile_url
      end
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
        field :icon
        field :large_icon
        field :short_description do
          help "showed on home page"
        end
        field :description
      end
    end

    config.model ProcessStep do
      nestable_list position_field: :position

      edit do
        field :published
        field :name
        field :icon
        field :description
      end
    end

    config.model User do
      field :email
      field :password
      field :password_confirmation
      field :name
      field :avatar
      field :articles
    end





  end

end