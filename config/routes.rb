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
   get 'shop', to: 'shop#index', as: :shop

end
