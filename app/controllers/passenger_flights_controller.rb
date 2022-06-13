class PassengerFlightsController < ApplicationController

  def destroy
    PassengerFlight.remove_passenger(params[:passenger_id], params[:flight_id])
    redirect_to controller: :flights, action: :index
  end

end
