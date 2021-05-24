Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations] 
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      patch 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
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
    resources :requests
    resources :employees, :controller => 'employees'
    resources :items
    resources :dashboards
  end

  namespace :manager do
    resources :devices
    resources :delivers
  end
end
