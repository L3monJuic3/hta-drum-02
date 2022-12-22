Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  get 'user_bookings', to: 'bookings#user_bookings'
  get 'confirmation', to: 'bookings#create'

  resources :lessons do
    resources :bookings, only: %i[create new]
  end
end
