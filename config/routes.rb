Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  get '/about', to: 'pages#about'
  # get 'bookings', to: 'bookings#user_bookings'
  # get 'confirmation', to: 'bookings#create'
  get '/lessons/:lesson_id/bookings/:id', to: 'bookings#my_bookings', as: 'my_bookings'

  resources :lessons do
    resources :bookings, except: %i[index destroy]
  end

  resources :bookings, only: %i[index destroy]
end
