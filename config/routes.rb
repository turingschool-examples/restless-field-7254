Rails.application.routes.draw do

  resources :flights, only: [:index]

  delete "/passenger_flights", to: "passenger_flights#destroy"
  # resources :passenger_flights, only: [:destroy]

end
