Rails.application.routes.draw do
  devise_for :users
  root to: "blocs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Routes pour les blocs
  resources :blocs, only: [:index, :show] do
    resources :chats, only: [:create]
  end
  get 'revisions/page1', to: 'revisions#page1', as: :bloc_page1
  get 'revisions/page2', to: 'revisions#page2', as: :bloc_page2
  get 'revisions/page3', to: 'revisions#page3', as: :bloc_page3
  get 'revisions/page4', to: 'revisions#page4', as: :bloc_page4


  # Routes pour les chats avec messages nestés
  resources :chats, only: [:show] do
    resources :messages, only: [:create]
  end
end
