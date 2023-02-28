Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  namespace :api do
    namespace :v1 do
      resources :pets
      resources :park_visits
      resources :scans
      resources :users do
        member do
          get :confirm_email
        end
      end
      get 'nearby_users', to: 'users#nearby_users'
      get 'set_user_coords', to: 'users#set_user_coords'
      get 'nearby_posters', to: 'posters#nearby_posters'
      resources :posters
      resources :tags
      get '/tags/:id', to: 'tags#show'
      resources :messages
      resources :devices
      post '/login', to: 'auth#login'
      get '/login', to: 'auth#auto_login'
    end
  end
  get '/missing-posters', to: 'web#index'
  get '/profile/:id', to: 'web#show'
  get '/home', to: 'home#index'
  get '/support', to: 'support#index'
  get '/verified', to: 'confirm#index'
end
