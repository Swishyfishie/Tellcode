Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  get 'login', to: 'sessions#new', as: 'login'
  
  post 'logout', to: 'sessions#destroy', as: 'logout'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get,:post]


  get 'welcome', to: 'sessions#welcome' #to delete

  resources :cards, only: [:index, :new, :create, :edit, :update]
  # resources :sessions, only: [:create]
  resources :users
  resources :days do 
    resources :cards, only: [:index, :show]
  end    



end
