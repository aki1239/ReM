Rails.application.routes.draw do
  devise_for :users
 root to: 'movies#index'
 resources :movies
end
