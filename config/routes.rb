Rails.application.routes.draw do
  root 'home#index'
  resources :movies
  resources :users
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
