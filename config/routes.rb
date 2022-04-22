Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :roles
  resources :skills
  resources :designations
  resources :leafs
  resources :attendences
  resources :salaries
  resources :daily_tasks
  get 'dashboard/index'
  root "dashboard#index"
  resources :performances
  resources :holidays
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees
  resources :employees

  get '/set_ip', to: "dashboard#set_ip"
  get '/profile', to: "employees#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "password/reset", to: "password_resets#new" 
  post "password/reset", to: "password_resets#create" 

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update" 

  
end
