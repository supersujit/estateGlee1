Rails.application.routes.draw do
  resources :properties
  get 'dashboards/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'dashboards#index'
  resources 'dashboards', only: :index
end
