class FlightPassengersController < ApplicationController

  def destroy
    @passenger = Passenger.find(params[:id])
    flight_passenger = FlightPassenger.destroy(@passenger.flight_passengers.first.id)
    redirect_to flights_path
  end

end
