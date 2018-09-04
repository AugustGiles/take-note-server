Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create, :destroy]
  resources :assignments, only: [:index, :create]

  post '/login', to: 'auth#login'
  get '/profile', to: 'users#profile'
  patch 'assignments/currentpractice/:id', to: 'assignments#update_current_practice_time'

end
