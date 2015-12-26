Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { sessions: "users/sessions" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  show_stub = false

  if show_stub
    get "home", to: "pages#index"
    root to: "pages#under_construction", as: :stub
  else
    root to: "pages#index"
  end




  controller :pages do
    get "under_construction"
    get "about-us", action: "about_us"
    get "contacts"
    get "process", action: "process_page", defaults: { route_name: :process }
    get "terms-of-use", action: "terms_of_use"
    get "privacy-policy", action: "privacy_policy"
    get "career"
    get "sitemap"
  end

  resources "teams", only: [:index, :show]
  resources "services", only: [:index, :show]
  resources "industries", only: [:index, :show]
  resources "benefits", only: [:index, :show]

  scope "blog", controller: "blog" do
    get "", action: "index", as: :blog
    get ":id", action: "show", as: "blog_article"
    get "/tags/:tags", action: "index", as: :article_tags
  end



  post "career", to: "vacancies#create", as: :vacancy_request

  post "message", to: "messages#create"

  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end
