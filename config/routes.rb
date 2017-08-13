Rails.application.routes.draw do
  root 'sessions#index'
  resources :users
  resources :rides
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
end
