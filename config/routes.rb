Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  #Casein routes
  namespace :casein do
    resources :slots
    resources :users do
      get 'slots', to: 'slots#user_slots'
    end
    resources :events do
      get 'slots', to: 'slots#event_slots'
      resources :slots, only: [:show, :update]
      get 'users', to: 'events#see_users'
    end
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  root to: 'pages#home'
  scope '(:locale)', locale: /pt|en/ do
    root to: 'pages#home'

    get 'about', to: 'pages#about'
    get 'account', to: 'pages#account'
    patch 'confirm_my_bookings', to: 'pages#confirm_my_bookings'
    get 'contact', to: 'pages#contact'
    resources :events, only: [:index, :show] do
      resources :slots, only: [:index, :show, :update]
    end
    resources :slots, only: [:show] do
      patch 'cancel_session', to: 'pages#cancel_session'
    end
  end

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.is_admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
