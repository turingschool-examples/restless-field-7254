class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def destroy
  Flight.find(params[:id]).flight_passengers.where("passenger_id = #{params[:passenger_id]}").first.destroy
  redirect_to '/flights'
end
end
