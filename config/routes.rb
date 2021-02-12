Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: "homes#top"
  get "home/about" => 'homes#about'

  resources :users, only: [:edit, :update]
  resources :tasks
  patch "/tasks/:id/change_matrix" => 'tasks#change_matrix'
  resources :comments, only: [:create, :destroy]
  resources :routines, only: [:index, :create, :destroy]
  resources :notifications, only: [:index, :show]
  delete "notifications/destroy_all" => 'notifications#destroy_all'
  resources :calendars, only: [:index]
  resources :groups, only: [:index, :create, :show, :update, :destroy]
  post "groups/:id/confirm" => 'groups#confirm'
  get "groups/:id/destroy_confirm" => 'groups#destroy_confirm', as: "group_destroy_confirm"
  get "groups/:id/withdrawal_confirm" => 'groups#withdrawal_confirm', as: "group_withdrawal_confirm"
  delete "groups/:id/withdrawal" => 'groups#withdrawal', as: "group_withdrawal"
end
