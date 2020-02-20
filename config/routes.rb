Rails.application.routes.draw do
  resources :notifications
  resources :subscriptions
  resources :tells
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#home"

  get 'publish/:id', :to => 'publisher#publish_tell'

end
