Rails.application.routes.draw do
  get 'users/index'
  root 'users#index'
  
  devise_for :users
  resources :users do
    member do
      get :account
    end
  end
  resources :requests do
    resources :comments
  end

  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
end
