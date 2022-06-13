Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :flights
  get "/flights", to: "flights#index"

  delete '/flights', to: 'flights#delete'

  get "/airlines/:id", to: 'airlines#show'

end
