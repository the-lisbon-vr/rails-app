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
  scope '(:locale)', locale: /pt|en/ do
    root to: 'pages#home'

    get 'about', to: 'pages#about'
    get 'account', to: 'pages#account'
    get 'contact', to: 'pages#contact'
    resources :events, only: [:index, :show] do
      resources :slots, only: [:index, :show, :update]
    end
    resources :slots, only: [:show] do
      patch 'cancel_session', to: 'pages#cancel_session'
    end
  end
end
