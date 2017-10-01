Rails.application.routes.draw do

  devise_for :users
  resources :orders
  resources :address

  get 'payment_methods/get_payment_methods'
  post 'payment_methods/set_payment_methods'
  
  root to: 'orders#index'
end
