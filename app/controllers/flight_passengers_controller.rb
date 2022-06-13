class FlightPassengersController < ApplicationController
  def destroy
    passenger = FlightPassenger.destroy(params[:id])
    redirect_to flights_path
  end
end