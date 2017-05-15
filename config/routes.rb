Rails.application.routes.draw do

  #Casein routes
  namespace :casein do
    resources :events do
      resources :slots
    end
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root to: 'pages#home'
  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'

    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    resources :events, only: [:index, :show] do
      resources :slots, only: [:index, :update]
    end

    resources :slots, only: [:show]
  end
end
