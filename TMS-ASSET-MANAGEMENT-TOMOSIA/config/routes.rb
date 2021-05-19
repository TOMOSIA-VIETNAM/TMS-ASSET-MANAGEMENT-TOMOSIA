Rails.application.routes.draw do
  devise_for :users
  resources :requests, only: [:create, :destroy]
  # get '/' => "requests#index", :as => :user_root
  resources :users
  
  namespace :manager do
    resources :devices
  end

  namespace :employee do
    resources :requests
    resources :profiles

  end
end
