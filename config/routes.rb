Rails.application.routes.draw do
  resources :admins
  get 'search', to: 'admins#search'

  resources :prescriptions

  namespace :admins do
    resources :prescriptions
  end

  resources :prescriptions do
    resources :medicines
    resources :checkers, only: %i[create destroy]
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts, only: %i[index new create destroy]
  end

  resources :comments, only: %i[new create destroy]

  resources :notifications, only: %i[destroy update]

  root to: 'home#index'
  get '/about' => 'home#about'
end
