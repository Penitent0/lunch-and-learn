Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/recipes', to: 'recipes#index'
      get '/learning_resources', to: 'learning_resources#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#login'
      get '/tourist_sights'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
