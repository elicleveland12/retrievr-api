Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :pets
      resources :users
      resources :posters
      resources :tags
      post '/login', to: 'auth#login'
      get '/login', to: 'auth#auto_login'
    end
  end
end
