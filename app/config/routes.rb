Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end
end
