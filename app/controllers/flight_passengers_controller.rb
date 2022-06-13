class FlightPassengersController < ApplicationController
  def destroy
    record = FlightPassenger.where(flight_id: params[:flight_id], passenger_id: params[:id]).first
    record.destroy
    redirect_to "/flights"
  end
end
