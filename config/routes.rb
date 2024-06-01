Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:show, :create, :index, :edit, :destroy, :update]
  get 'home/about' => 'homes#about'
  get 'homes/top'
  resources :users, only: [:index, :show, :edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
