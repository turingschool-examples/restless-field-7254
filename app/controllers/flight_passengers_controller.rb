class FlightPassengersController < ApplicationController

  def destroy
    @flight = Flight.find(params[:flight_id])
    @passenger = Passenger.find(params[:id])
    @flight_passenger = FlightPassenger.find_by(flight_id: @flight.id, passenger_id: @passenger.id)
    @flight_passenger.destroy
    redirect_to flights_path
  end

end
