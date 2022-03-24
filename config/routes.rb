Rails.application.routes.draw do
  resources :holidays
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "employees#index"
  devise_for :employees
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
