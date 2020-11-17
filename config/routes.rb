Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, except: [:index] do
    member do
      get :bookings
    end
    member do
      get :tents
    end
  end

  resources :tents do
    resources :bookings, only: [:index, :new, :create, :edit, :update]
  end

  resources :bookings, only: [:destroy]
end
