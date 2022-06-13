Rails.application.routes.draw do
  get '/airlines/:airline_id', to: 'airlines#show'

  get '/flights', to: 'flights#index'
  delete '/flights/:flight_id/:passenger_id', to: 'flights#destroy'

end
