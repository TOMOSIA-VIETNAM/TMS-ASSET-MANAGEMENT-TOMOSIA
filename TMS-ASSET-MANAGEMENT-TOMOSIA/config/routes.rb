Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items
  
  namespace :employee do
    resources :requests
    resources :profiles
  end

  namespace :admin do
    resources :approves
  end

end
