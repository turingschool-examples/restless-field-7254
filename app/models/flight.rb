class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passengers
  has_many :passengers, through: :passenger_flights
end

