# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tickets
  mount Ckeditor::Engine => '/ckeditor'
  resources :roles
  resources :skills
  resources :designations
  resources :leafs
  resources :attendences do
    collection do
      get :update_attendence
    end
  end
  resources :salaries
  resources :daily_tasks
  get 'dashboard/index'
  root 'dashboard#index'
  resources :performances
  resources :holidays
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees
  resources :employees do
    collection do
      get :search
    end
  end

  namespace :hr do
    resources :employees
    resources :attendences
    get '/emp-attendance/:id', to: 'attendences#show_attendence', as: 'show_attendance'
    get '/search', to: 'attendences#search'
  end

  namespace :api do
    namespace :v1 do
      get '/performances', to: 'performances#index'
    end
  end

  get '/set_ip', to: 'dashboard#set_ip'
  get '/profile', to: 'employees#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Employee', at: 'auth'
      resources :employees
    end
  end

  patch '/accept/:id', to: 'tickets#decline_ticket', as: 'decline_ticket'
end
