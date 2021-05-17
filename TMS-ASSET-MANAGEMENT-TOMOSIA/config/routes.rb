Rails.application.routes.draw do
  devise_for :users
  resources :request
  get '/' => "request#index", :to => :request_index_path
  resources :users
end
