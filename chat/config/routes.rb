Rails.application.routes.draw do
  get 'conversations/create'

  root 'home#index'

  devise_for :users

  resources :conversations, only: [:create]
end