Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users,only: [:show,:index,:edit,:update,:create]
  resources :books
  get 'home/about' => 'homes#about'
end