Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users
  resources :categories
  resources :purchases
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'splash#index', as: :unauthenticated_root
    end
  end
end
