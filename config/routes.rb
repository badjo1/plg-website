Rails.application.routes.draw do
  
  root "pages#home"

  # authentication logic routes
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  # delete "logout", to: "user_sessions#destroy"
  # post "logout", to: "user_sessions#destroy"
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

end
