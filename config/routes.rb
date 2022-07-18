Rails.application.routes.draw do
  resources :animated_gifs do
    resources :animated_blocks, only: [:new, :create]
  end
  resources :animated_blocks, only: [:edit, :update, :destroy] do
    member do
      get 'copy'
    end
  end
  
  # authentication logic routes
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  get "logout", to: "user_sessions#destroy"

  get "order", to: "pages#home"
  # api to fetch nonces for users
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  resources :events
  resources :users

  root "pages#home"

end
