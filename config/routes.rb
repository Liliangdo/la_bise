Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get '/dashboard', to: 'pages#dashboard'

  resources :events, only: [:index, :show, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
    resources :reviews, only: [:index, :create]
    resources :reservations, only: [:index, :new, :create, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
mount Attachinary::Engine => "/attachinary"
end

