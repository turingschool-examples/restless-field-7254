class PassengerFlightsController < ApplicationController
  def destroy
    PassengerFlight.find(params[:id]).destroy
    redirect_to flights_path
  end

  private

  def passenger_flights_params
    params.permit(:flight_id, :passenger_id)
  end
end
