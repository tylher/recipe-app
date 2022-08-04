# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :foods
    resources :recipes do
      member do
        get :toggle_public
      end
    end
  end
  # Defines the root path route ("/")
  # get '/recipes', to: 'recipes#index' 
  root 'recipes#index' 
end
