Rails.application.routes.draw do
  get 'tasks/index'
  devise_for :users
  root to: "homes#top"
  get "home/about" => 'homes#about'

  resources :users, only: [:index, :edit, :update]
  resources :tasks
end
