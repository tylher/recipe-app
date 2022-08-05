# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :foods, except: :update
    resources :recipes, except: :index do
      member do
        get :toggle_public
      end
      resources :recipe_foods, only: [:create,:new,:index, :destroy]
    end
    
  end
  # Defines the root path route ("/")
  get '/recipes', to: 'recipes#index'
  get '/general_shopping_list', to: 'user#general_shopping_list' 
  get '/public_recipes', to: 'public_recipes#index'
  root 'recipes#index' 
end
