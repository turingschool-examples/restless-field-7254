Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: %i[index] do
    resources :passengers, controller: :flight_passengers, only: %i[destroy]
  end

  resources :airlines, only: %i[show]
end
