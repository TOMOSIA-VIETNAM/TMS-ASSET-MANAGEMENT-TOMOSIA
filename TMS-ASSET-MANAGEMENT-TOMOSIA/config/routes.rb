Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations] 
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      patch 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  match '/admin/items/export_stock' => 'admin/items#export_csv_stock', :as => 'admin_item_export_stock', :via => :get
  match '/admin/items/export_broken' => 'admin/items#export_csv_broken', :as => 'admin_item_export_broken', :via => :get

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
    resources :employees, :controller => 'employees'
    resources :items
    resources :dashboards
  end

  namespace :manager do
    resources :items
    resources :delivers
    resources :devices
  end
end
