Rails.application.routes.draw do
  resources :medicines
  resources :prescriptions
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users


  root to: "home#index"
end
