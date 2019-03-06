Rails.application.routes.draw do
  root 'home#index'
  get 'home/show'
  get 'change/:id', to: 'notifications#change', as: 'change'
  devise_for :users
  resources :blogs do
  	resources :comments
  	resources :likes
  end
  resources :notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
