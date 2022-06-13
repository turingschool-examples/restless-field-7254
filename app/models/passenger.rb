class Passenger < ApplicationRecord
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights

  def flight_association(flight_id)
    passenger_flights.select(:id)
                     .where(flight_id: flight_id)
                     .last
                     .id
  end
end
