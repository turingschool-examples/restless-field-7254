class PassengerFlightsController < ApplicationController

  def delete
    passenger_flight = PassengerFlight.find(params[:id])
    passenger_flight.delete
    redirect_to "/flights"
  end
end
