Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :categories
  resources :orders
  resources :users
  post 'search', to: 'books#search'
end
