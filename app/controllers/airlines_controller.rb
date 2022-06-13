class AirlinesController < ApplicationController

  def show
    @airline = Airline.find(params[:airline_id])
  end
end
