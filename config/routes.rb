Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'orders/show'
  get 'products/show'
  get 'products/index'
  get 'categories/index'
  get 'categories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
