Rails.application.routes.draw do
  resources :teams, only: [:new, :edit, :update, :create] 
  resources :leagues
  post '/leagues/:id', to: 'leagues#draft'
  resources :candidates, only: [:index, :show, :update, :create] 
  resources :leagues_users
  resources :rules, only: [:index]
  devise_for :users
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#show"
end
