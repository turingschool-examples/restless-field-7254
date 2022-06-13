class PassengerFlightsController < ApplicationController
  def destroy
    passenger_flight = PassengerFlight.find(params[:id])
    passenger_flight.destroy
    redirect_to flights_path
  end
end
