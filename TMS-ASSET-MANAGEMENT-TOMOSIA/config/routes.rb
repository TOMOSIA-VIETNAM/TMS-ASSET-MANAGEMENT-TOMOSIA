Rails.application.routes.draw do
  devise_for :users
  resources :requests, only: [:create, :destroy]
  resources :users
  resources :items
  
  root 'employee/requests#show'

  namespace :employee do
    resources :requests
  end
end
