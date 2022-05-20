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

  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end
end
