class FlightPassengersController < ApplicationController
  def destroy
    flight_passenger = FlightPassenger.find_by(flight_id: params[:flight_id], passenger_id: params[:passenger_id])
    flight_passenger.destroy
    redirect_to "/flights"
  end
end
