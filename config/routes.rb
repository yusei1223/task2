Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books,only: [:index, :show, :edit, :create, :update, :destroy] do
   resource :favorites,only: [:create, :destroy]
   resources :book_comments,only: [:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update,]
  get 'home/about' => 'homes#about'
end