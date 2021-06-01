Rails.application.routes.draw do
  
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :tracks do
        collection do
          get :top_100
          get :random
          get :search
        end
      end
      resources :playlists do
        collection do
          post :search
        end
      end
      resources :reviews, only: [:index, :show, :create]
    end
  end
end