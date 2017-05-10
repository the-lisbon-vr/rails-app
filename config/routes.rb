Rails.application.routes.draw do

  #Casein routes
  namespace :casein do
    resources :events do
      resources :slots
    end
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'

    get 'about', to: 'pages#about'
    resources :events, only: [:index, :show] do
      resources :slots
    end
  end
end
