Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/airlines/:id', to: 'airlines#show'

  get '/flights', to: 'flights#index'
  delete '/flights/:f_id/passengers/:p_id', to: 'passenger_flights#destroy'

end
