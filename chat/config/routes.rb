Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :conversations, only: [:create, :delete] do
    member do
      post :close
      delete :destroy
    end
    resources :messages, only: [:create]	
   end
  
end