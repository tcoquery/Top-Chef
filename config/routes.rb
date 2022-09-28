Rails.application.routes.draw do
  resources :teams
  resources :leagues

  get '/leagues/:id', to: 'home#show'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#show"
end
