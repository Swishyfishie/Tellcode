Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'


  resources :users, only: [:new, :create]
  resources :days, only: [:show] do 
    resources :cards, only: [:index]
  end    


end
