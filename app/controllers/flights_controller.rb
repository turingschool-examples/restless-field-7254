class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    fp = FlightPassenger.find_by(flight_id: "#{flight.id}", passenger_id: "#{passenger.id}")
    require "pry"; binding.pry
    fp.destroy
    redirect_to '/flights'
  end

  private
  def fp_params
    params.permit(:flight_id, :passenger_id)
  end
end