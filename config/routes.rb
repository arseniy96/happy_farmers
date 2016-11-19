Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :users, only: [:show, :index]

  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
