Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  get 'signup', to: 'users#new', as: 'signup'

  get 'login', to: 'sessions#new', as: 'login'

  post 'login', to: 'sessions#create'
  
  post 'logout', to: 'sessions#destroy', as: 'logout'

  post '/users/:id', to: 'users#destroy', as: 'delete_account'  

  match 'auth/:provider/callback', to: 'sessions#github_create', via: [:get, :post]


  resources :cards, only: [:index, :new, :create]

  resources :users, only: [:new, :create, :show,:edit, :update] do 
    resources :cards, only: [:index]
  end
  
  resources :days do 
    resources :cards, only: [:index, :show]
    resources :users, only: [:index]
  end    



end
