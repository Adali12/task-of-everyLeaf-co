Rails.application.routes.draw do
  resources :tasks
  # get 'task/index'
  resources :task
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
