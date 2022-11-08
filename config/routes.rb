Rails.application.routes.draw do
    devise_for :users, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        sign_up: 'signup'
      }

   root 'users#index'
   get 'users/show', to: 'users#show', as: 'user_recipes'
   get 'foods', to: 'foods#index', as: 'foods'
end
