Rails.application.routes.draw do
  get 'messages/create'
  get 'chats/create'
  get 'blocs/index'
  get 'blocs/show'
  get 'users/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Routes pour les blocs
  resources :blocs, only: [:index, :show]

  # Routes pour les chats avec messages nestés
  resources :chats, only: [:create] do
    resources :messages, only: [:create]
  end
end
