Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  get 'signup', to: 'users#new', as: 'signup'

  get 'login', to: 'sessions#new', as: 'login'

  post 'login', to: 'sessions#create'
  
  post 'logout', to: 'sessions#destroy', as: 'logout'


  match 'auth/:provider/callback', to: 'sessions#github_create', via: [:get, :post]


  resources :cards, only: [:index, :new, :create, :edit, :update]

  resources :users, only: [:new, :create, :show]
  resources :days do 
    resources :cards, only: [:index, :show]
  end    



end
