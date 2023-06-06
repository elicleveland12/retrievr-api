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
      get 'ping', to: 'users#ping'
      get 'nearby_posters', to: 'posters#nearby_posters'
      get 'top_dogs', to: 'park_visits#top_dogs'
      get 'active_in_park', to: 'park_visits#active_in_park'
      post 'check_out_of_park', to: 'park_visits#check_out_of_park'
      resources :posters
      resources :tags
      get '/tags/:id', to: 'tags#show'
      resources :messages
      resources :devices
      post '/login', to: 'auth#login'
      get '/login', to: 'auth#auto_login'
      post '/send_reset_password_token', to: 'auth#send_reset_password_token'
      post '/reset_password', to: 'auth#reset_password'
    end
  end
  get '/missing-posters', to: 'web#index'
  get '/profile/:id', to: 'web#show'
  get '/home', to: 'home#index'
  get '/support', to: 'support#index'
  get '/verified', to: 'confirm#index'
end
