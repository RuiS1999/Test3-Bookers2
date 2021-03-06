Rails.application.routes.draw do

  get 'users/show'
  get 'users/index'
  get 'users/edit'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :books, only: [:edit, :index, :show, :create, :update, :destroy]
  resources :users, only: [:edit, :index, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end