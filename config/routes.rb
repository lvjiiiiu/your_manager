Rails.application.routes.draw do
  get 'notifications/index'
  get 'notification/index'
  get 'routines/index'
  get 'tasks/index'
  devise_for :users
  root to: "homes#top"
  get "home/about" => 'homes#about'

  resources :users, only: [:index, :edit, :update]
  resources :tasks
  resources :comments, only: [:create, :destroy]
  resources :routines, only: [:index, :create, :destroy]
  resources :notifications, only: [:index, :show]
  delete "notifications/destroy_all" => 'notifications#destroy_all'
end
