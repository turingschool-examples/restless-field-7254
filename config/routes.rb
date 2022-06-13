Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: %i[index]
  resources :passenger_flights, only: %i[destroy]
  resources :airlines, only: %i[show]
end
