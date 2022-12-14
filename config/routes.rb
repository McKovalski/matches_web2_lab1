Rails.application.routes.draw do
  resources :comments
  resources :matches
  resources :teams
  root 'matches#index'

  # auth0
  get '/auth/auth0', as: 'authentication'
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
end
