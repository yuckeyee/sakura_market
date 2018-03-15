Rails.application.routes.draw do
  root 'items#index'
  resources :carts, only: [:index]
  devise_for :users
  resources :orders, only: [:new, :create]
  post '/add_item' => 'carts#add_item'
  delete '/delete_item' => 'carts#delete_item'
end
