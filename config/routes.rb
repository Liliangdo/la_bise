Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: 'pages#home'

  scope '(:locale)', locale: /fr/ do
    get '/', to: 'pages#home'
    get '/dashboard', to: 'pages#dashboard'
    resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :messages, only: [:index, :new, :create, :edit, :update]
      resources :reviews, only: [:index, :create]
      resources :reservations, only: [:index, :new, :create, :update, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end

  mount Attachinary::Engine => "/attachinary"
end

