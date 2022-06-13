class FlightPassengersController < ApplicationController

  def destroy
    flight_pass = FlightPassenger.find_by(flight_id: params[:id], passenger_id: params[:passenger_id])
    flight_pass.destroy
    redirect_to(flights_path)
  end
end
