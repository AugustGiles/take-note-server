Rails.application.routes.draw do

  resources :users, only: [:index, :show]
  resources :assignments, only: [:index, :create]

  patch 'assignments/currentpractice/:id', to: 'assignments#update_current_practice_time'

end
