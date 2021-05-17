Rails.application.routes.draw do
  devise_for :users
  resources :requests, only: [:create, :destroy]
  # get '/' => "requests#index", :as => :user_root
  resources :users
  resources :items
  
  # resources :employee do
  #   collection do
  #     resources :requests
  #   end
  # end

  # namespace :manager do
  #   resources :devices
  # end

  namespace :employee do
    resources :requests
  end
end
