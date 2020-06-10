Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  post 'logout', to: 'sessions#destroy'
  get 'create_card', to: "cards#new"
  post 'create_card', to: "cards#create"

  resources :users
  resources :days do 
    resources :cards
  end    



end
