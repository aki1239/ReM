Rails.application.routes.draw do
  devise_for :users
 root to: 'movies#index'
 resources :movies do
  member do
    get 'genre'
  end
 end
end
