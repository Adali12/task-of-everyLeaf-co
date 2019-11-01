Rails.application.routes.draw do
  resources :tasks_labels
  resources :labels
  get 'sessions/new'
  resources :users
  resources :tasks
  # get 'task/index'
  resources :task
  root 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
