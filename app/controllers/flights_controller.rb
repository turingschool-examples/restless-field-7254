class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def delete
    @flight = Flight.find(params[:flight_id])
    # @flight.passenger_id.delete
    @flight.passengers.delete(Passenger.find(params[:passenger_id]))
    redirect_to "/flights"
  end

  # def destroy
  #   Passenger.find(params[:passenger_id]).destroy
  #   redirect_to "/flights"
  # end
end
