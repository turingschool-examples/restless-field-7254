class PassengerFlightsController < ApplicationController

  def destroy
    flight_passenger = PassengerFlight.all.where("flight_id = #{params[:f_id]}").where("passenger_id = #{params[:p_id]}")
    flight_passenger.first.destroy
    redirect_to "/flights"
  end

end
