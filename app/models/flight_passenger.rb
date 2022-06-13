class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger
  has_one :airline, through: :flight
end
