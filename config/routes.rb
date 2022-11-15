Rails.application.routes.draw do
  get 'favorites/index'
  namespace :api do
    namespace :v1 do
      post '/favorites', to: 'favorites#create'
      get '/recipes', to: 'recipes#index'
      get '/learning_resources', to: 'learning_resources#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#login'
      get '/tourist_sights', to: 'tourist_sights#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
