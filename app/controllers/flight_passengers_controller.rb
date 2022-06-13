class FlightPassengersController < ApplicationController
  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    FlightPassenger.where(flight_id: flight.id, passenger_id: passenger.id).destroy_all
    redirect_to "/flights"
  end
end