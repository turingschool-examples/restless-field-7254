Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: %i[index]

  resources :flights, only: [] do
    resources :passengers, only: %i[destroy], controller: 'flight_passengers'
  end

  resources :airlines, only: %i[show]
end
