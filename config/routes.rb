Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  show_stub = false

  if show_stub
    get "home", to: "pages#index"
    root to: "pages#under_construction", as: :stub
  else
    root to: "pages#index"
  end
  post "message", to: "messages#create"
end
