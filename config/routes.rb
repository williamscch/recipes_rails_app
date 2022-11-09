Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup'
  }

  root 'users#index'
  get 'users/:id', to: 'users#show', as: :user_recipes
  get 'foods', to: 'foods#index', as: :foods
  get 'foods/new', to: 'foods#new', as: :new_food
  post 'foods/create', to: 'foods#create'
  delete 'foods/:id', to: 'foods#destroy', as: :delete_food
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes/show', to: 'recipes#show', as: 'recipe'
  get 'recipes/new', to: 'recipes#new', as: 'recipes_new'
  post 'recipes/create', to: 'recipes#create', as: 'recipes_create'
  delete 'recipe/:id', to: 'recipes#destroy', as: :recipe_delete
  get 'shop', to: 'shop#index', as: :shop
end
