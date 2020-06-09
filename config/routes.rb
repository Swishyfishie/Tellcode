Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home'

  match "signup" => "users#signup", via: :get
  match "login" => "users#login", via: :get

  resources :users, only: [:show]
  resources :days, only: [:show] do 
    resources :cards, only: [:index]
  end    


end
