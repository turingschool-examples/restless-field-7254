class FlightPassengersController < ApplicationController 
    def destroy
        Passenger.find(params[:id]).find_flight_passenger(Flight.find(params[:flight_id]).id).destroy
        redirect_to flights_path   
    end
end