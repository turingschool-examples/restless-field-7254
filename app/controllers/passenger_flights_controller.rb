class PassengerFlightsController < ApplicationController

  def destroy
    pf = PassengerFlight.find(params[:id])
    pf.destroy
    redirect_to flights_path
  end
end
