require 'sidekiq/web'
require 'sidecloq/web'
Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :searches, only: %i[index show create destroy]
  resources :items, only: %i[show]

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end
  mount Sidekiq::Web => '/sidekiq'
end
