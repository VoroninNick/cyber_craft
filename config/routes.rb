Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get "home"

  root to: "pages#under_construction", as: :stub

  post "message", to: "messages#create"
end
