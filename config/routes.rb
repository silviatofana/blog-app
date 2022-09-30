Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  # rubocop:disable Style/SymbolArray
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:show, :index] do
          resources :comments, only: [:new, :create]
        end
      end
    end
  end
end
