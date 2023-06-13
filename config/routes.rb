Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  
  devise_for :users
  resources :users
    resources :requests
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
end
