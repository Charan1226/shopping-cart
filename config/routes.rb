Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  post 'add_to_cart/:id', to: 'carts#add_to_cart', as: 'add_to_cart'
  delete 'remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
end
