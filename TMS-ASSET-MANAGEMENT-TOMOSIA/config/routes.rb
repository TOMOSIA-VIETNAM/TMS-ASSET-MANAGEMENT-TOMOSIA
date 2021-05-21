Rails.application.routes.draw do
  devise_for :users
  resources :requests, only: [:create, :destroy]
  resources :users
  resources :items
  
  root 'employee/requests#index'

  namespace :employee do
    resources :requests
    resources :profiles
  end

end
