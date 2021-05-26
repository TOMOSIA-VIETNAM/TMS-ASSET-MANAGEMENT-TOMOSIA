Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :employee do
    resources :requests
    resources :profiles
  end

  namespace :admin do
    resources :requests
    resources :employees
  end

  namespace :manager do
    resources :items
    resources :delivers
    resources :devices
  end
end
