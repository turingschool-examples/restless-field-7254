class FlightPassengersController < ApplicationController
  def destroy
    # flight = Flight.find(params[:flight_id])
    passenger = FlightPassenger.find_by(passenger: params[:id], flight: params[:flight_id])
    passenger.destroy
    redirect_to flights_path
  end
end