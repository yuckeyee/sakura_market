Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  post '/add_item' => 'carts#add_item'
  delete '/delete_item' => 'carts#delete_item'
  resources :carts, only: [:index]
end
