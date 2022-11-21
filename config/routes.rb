Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
  get 'user_bookings', to: 'booking#user_bookings'
  get 'confirmation', to: 'booking#create'
  resources :lessons do
    resources :boookings, only: [:create]
  end
  resources :reservations, only: [:destroy]
end
