Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items
  # root :to => 'devise/sessions#new'
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :employee do
    resources :requests
    resources :profiles
  end

  namespace :admin do
    resources :approves
  end

  namespace :manager do
    resources :devices
    resources :delivers
  end
end
