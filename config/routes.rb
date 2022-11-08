Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup'
  }

  root 'users#index'
  # get 'users/show', to: 'users#show', as: 'user_recipes'
  get 'foods', to: 'foods#index', as: 'foods'
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes/show', to: 'recipes#show', as: 'recipe'
  get 'recipes/new', to: 'recipes#new', as: 'recipes_new'
  post 'recipes/create', to: 'recipes#create', as: 'recipes_create'

end
