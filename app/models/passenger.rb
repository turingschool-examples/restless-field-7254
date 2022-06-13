class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers

  def find_flight_passenger(flight)
    flight_passengers.where("flight_id = #{flight}").first
  end
  
  
end