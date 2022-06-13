Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/flights", to: "flights#index"
  get "/flights/:flight_id", to: "flights#show"
  get "/airlines/:airline_id", to: "airlines#show"
  delete "/flights/:flight_id/passengers/:passenger_id", to: "flight_passengers#destroy"
end
