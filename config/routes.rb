Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books,only: [:index, :show, :edit, :create, :update, :destroy] do
   resource :favorites,only: [:create]
    delete 'favorites' => 'favorites#destroy', as: "favorete"
   resources :book_comments,only: [:create, :destroy]
  end
  
  resources :users,only: [:show,:index,:edit,:update,] do
   member do
     get :following, :followers
    end
  resources :relationships, only: [:create]
   delete 'relationships' => 'relationships#destroy', as: "relationship"
  end
  
  get 'home/about' => 'homes#about'
end