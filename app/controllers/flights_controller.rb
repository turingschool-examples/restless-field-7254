class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def update
    passenger = Passenger.find(params[:id])
    if params[:update_status_to] == "removed"
      passenger.removed!
      redirect_to flights_path
    elsif params[:update_status_to] == "added"
      passenger.added!
      redirect_to flights_path
    elsif passenger.update(passenger_params)
      redirect_to flights_path
    end
  end

  private
    def passenger_params
      params.require(:passenger).permit(:name, :age, :status)

    end
end
