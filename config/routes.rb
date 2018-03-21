Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'items#index'
  resources :carts, only: [:index]
  devise_for :users
  resources :orders, only: [:index, :new, :create]
  post '/add_item' => 'carts#add_item'
  delete '/delete_item' => 'carts#delete_item'
end
