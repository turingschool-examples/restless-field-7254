class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights

  def uniq_passengers
    adults = []
    passengers.each do |passenger|
      if passenger.age >= 18
        adults << passenger
      end
    end
    adults.uniq
  end
end
