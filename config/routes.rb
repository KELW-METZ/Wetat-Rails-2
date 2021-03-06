Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api , defaults: { format: 'json'} do
    namespace :v1 do
      resources :artists, only: [:index, :show]
      get '/artists/search/:query', to: 'artists#search'
      resources :shops, only: [:index, :show]
      resources :arts,  only: [:show]
      resources :favorites, only: [:index, :create, :destroy]
      resources :messages, only: [:create]
      get '/conversation/:user_id', to: 'messages#conversation'
      get '/conversations', to: 'messages#conversations'
    end
  end
  post '/login', to: "login#login"
  put '/login', to: 'login#update'
end
