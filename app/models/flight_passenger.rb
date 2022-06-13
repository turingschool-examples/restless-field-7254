class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.fp_find
    where(flight_id: flight.id, passenger_id: self.passenger.id)
  end
end