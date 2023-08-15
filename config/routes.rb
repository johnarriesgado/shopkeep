Rails.application.routes.draw do
  root 'home#index'

  # Define routes for login and signup
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'

  get '/jobs', to: 'jobs#index', as: 'jobs_index'
  resources :jobs, only: [:new, :create, :show]
  get '/my-profile', to: 'profile#index', as: 'my_profile'
  
  # Define routes for job posting after logging in
  authenticated :user do
    root 'jobs#index', as: :authenticated_root
  end
  
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
end
