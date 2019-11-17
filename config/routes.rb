Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  namespace :api do
    namespace :v1 do
      resources :pets
      resources :users do
        member do
          get :confirm_email
        end
      end
      resources :posters
      resources :tags
      resources :breeders
      resources :litters
      resources :shelters
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
