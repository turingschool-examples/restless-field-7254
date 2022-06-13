Rails.application.routes.draw do

  resources :flights, only: [:index]
  resources :airlines, only: [:show]

  delete '/flights/:flight_id/passengers/:id', to: 'passenger_flights#destroy'
end
