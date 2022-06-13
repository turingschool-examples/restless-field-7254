Rails.application.routes.draw do

  resources :flights, only: [:index]

  delete "/passenger_flights/:flight_id/:passenger_id", to: "passenger_flights#destroy"
  # resources :passenger_flights, only: [:destroy]

end
