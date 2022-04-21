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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
