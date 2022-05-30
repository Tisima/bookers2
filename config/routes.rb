Rails.application.routes.draw do
  devise_for :users
  root to:  'homes#top'
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get '/home/about', to: 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end