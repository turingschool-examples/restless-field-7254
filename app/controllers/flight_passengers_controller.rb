class FlightPassengersController < ApplicationController
  def destroy
    passenger = FlightPassenger.find_by(flight: params[:flight_id], passenger: params[:passenger_id])
    passenger.destroy
    redirect_to "/flights"
  end
end
