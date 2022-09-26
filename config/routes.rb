Rails.application.routes.draw do
  # rubocop:disable Style/SymbolArray
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
end