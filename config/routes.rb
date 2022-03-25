Rails.application.routes.draw do
  get 'dashboard/index'
  resources :performances
  resources :holidays
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "dashboard#index"
  devise_for :employees
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
