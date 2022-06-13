class Passenger < ApplicationRecord
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights
  has_many :airlines, through: :flights

  validates_presence_of :name, :age
end
