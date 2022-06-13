Rails.application.routes.draw do

  get '/flights', to: 'flights#index'
end
