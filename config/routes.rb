Rails.application.routes.draw do
  get 'post_images/new'
  get 'post_images/show'
  get 'post_images/index'
  resources :books, only: [:show, :create]
  get 'homes/about' => 'homes#about'
  get 'homes/top'
  get '/users/:id/edit',to:'users#edit'
  get 'books',to:'books#index'
  get 'users',to:'users#index'
  resources :post_images, only: [:new, :create, :index, :show]
  #get 'users/:id',to:'users#show',as:'users_id'
  devise_for :users
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
