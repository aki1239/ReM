Rails.application.routes.draw do
  devise_for :users
 root to: 'movies#index'
 resources :movies do
  
 end
 get '/movie/genre', to: "movies#genre"
end
