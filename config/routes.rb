Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show]
  root 'users#new'

  resources :rides, only: :create

  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]

  get '/signin', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
