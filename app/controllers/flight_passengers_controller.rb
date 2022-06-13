class FlightPassengersController < ApplicationController
  def destroy
    # flight = Flight.find(params[:flight_id])
    passenger = FlightPassenger.destroy(params[:id])
    redirect_to flights_path
  end
end