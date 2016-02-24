Rails.application.routes.draw do
  root to: "sites#root"
  post "login" => "sessions#create"
  delete "sessions" => "sessions#destroy"
  post "signup" => "users#create"
  post "addtocart" => "carts#add_to_cart"
  post "removefromcart" => "carts#remove_from_cart"
  resources :sessions, only: [:create, :new, :destroy]
  resources :users, only: [:show, :create, :new]
  resources :products, only: [:index, :show]
  resources :carts, only: [:show, :add_to_cart, :remove_from_cart]
end
