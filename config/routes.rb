Rails.application.routes.draw do
  resources :comments
  resources :properties
  get 'properties/:id/comments', to: "properties#comments", as: "get_property_comments"
  get 'properties/:id/comments/new', to: "properties#new_comment", as: "new_property_comment"
  post 'properties/:id/comments', to: "properties#create_comment", as: "create_property_comments"
  get 'properties/:id/history_items', to: "properties#history_items", as: "get_property_history_items"
  get 'dashboards/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'dashboards#index'
  resources 'dashboards', only: :index
end
