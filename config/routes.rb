Rails.application.routes.draw do
  root to: 'tasks#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get 'task', to:'tasks#show'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :tasks, only: [:create, :destroy, :show]
end