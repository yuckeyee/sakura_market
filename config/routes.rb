Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  post '/add_item' => 'carts#add_item'
  resources :carts, only: [:index]
end
