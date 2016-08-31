Rails.application.routes.draw do

  get 'payments/new'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: 'pages#home'

  scope '(:locale)', locale: /fr/ do
    get '/', to: 'pages#home'
    get '/dashboard', to: 'pages#dashboard'
    resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :messages, only: [:index, :new, :create]
      resources :reviews, only: [:index, :create]
      resources :reservations, only: [:index, :new, :create, :update, :destroy] do
        resources :payments, only: [:new, :create]
      end
    end
    resources :users, only: [:show, :edit, :update]
  end

  mount Attachinary::Engine => "/attachinary"
end

