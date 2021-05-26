Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  match '/manager/devices/export_stock' => 'manager/devices#export_csv_stock', :as => 'manager_item_export_stock', :via => :get
  match '/manager/devices/export_broken' => 'manager/devices#export_csv_broken', :as => 'manager_item_export_broken', :via => :get

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
