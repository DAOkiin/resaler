require 'sidekiq/web'
require 'sidecloq/web'
Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :searches

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end
  mount Sidekiq::Web => '/sidekiq'
end
