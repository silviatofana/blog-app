Rails.application.routes.draw do
  # rubocop:disable Style/SymbolArray
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"

  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy' end


  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
end



