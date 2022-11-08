Rails.application.routes.draw do
    devise_for :users, path: ''

   get '/', to: 'users#index'
end
