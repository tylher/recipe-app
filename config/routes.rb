# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :foods, except: :update
    resources :recipes
  end
  # Defines the root path route ("/")
  root 'recipes#index'

  get '/public_recipes', to: 'recipies#public_recipies'
end
