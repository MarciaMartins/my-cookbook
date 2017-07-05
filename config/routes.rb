Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/my_recipes', to: 'recipes#user_recipes'
  
  resources :recipes, only: [:show, :new, :create, :edit, :update, :index] do
    get 'search', on: :collection
  end
  resources :cuisines, only: [:show, :new, :create, :edit, :update]
  resources :recipe_types, only: [:show, :new, :create]
end
