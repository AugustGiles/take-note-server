Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create, :destroy]
  resources :assignments, only: [:index, :create, :show]
  resources :resources, only: [:index, :create, :destroy]
  resources :youtubes, only: [:index, :create, :destroy]

  post '/login', to: 'auth#login'
  get '/profile', to: 'users#profile'
  patch 'assignments/currentpractice/:id', to: 'assignments#update_current_practice_time'
  patch '/attachrecording', to: 'assignments#attach_recording'

end
