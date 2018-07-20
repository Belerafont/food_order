Rails.application.routes.draw do
  devise_for :users
  root 'menus#index'

  resources :orders
  resources :menus

  namespace :admin do
    resources :users
    resources :orders
    resources :menus
    resources :dish_items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
