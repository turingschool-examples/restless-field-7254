class PassengersController < ApplicationController
  def update
    @flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:id])
    passenger.update(passenger_status_params)
    redirect_to flights_path
  end

  private
    def passenger_status_params
      params.permit(:status)
    end
end
