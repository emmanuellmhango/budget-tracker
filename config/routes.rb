Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users
  resources :categories
  resources :purchases
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "categories#index"
end
