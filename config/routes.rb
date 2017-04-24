Rails.application.routes.draw do

  #Casein routes
  namespace :casein do
    resources :events
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
  end
end
