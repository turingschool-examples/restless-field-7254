class FlightPassengersController < ApplicationController
  def destroy 
    flight_passenger = FlightPassenger.find_by(flight_id: params[:flight_id])
    flight_passenger.destroy 
    redirect_to flights_path
  end
end