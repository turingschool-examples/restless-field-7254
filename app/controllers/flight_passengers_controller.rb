class FlightPassengersController < ApplicationController
  def destroy
    flight_passenger = FlightPassenger.where(flight_id: params[:flight_id]).where(passenger_id: params[:id]).first
    flight_passenger.destroy
    redirect_to flights_path
  end
end
