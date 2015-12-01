Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  show_stub = false

  if show_stub
    get "home", to: "pages#index"
    root to: "pages#under_construction", as: :stub
  else
    root to: "pages#index"
  end


  controller :pages do
    get "about_us"
    get "contacts"
    get "process", action: "process_page"
    get "terms_of_use"
    get "privacy_policy"
    get "career"
  end

  resources "teams", only: [:index, :show]
  resources "services", only: [:index, :show]
  resources "industries", only: [:index, :show]

  scope "blog", controller: "blog" do
    get "", action: "index", as: :blog
    get ":id", action: "show"
  end



  post "message", to: "messages#create"
end
