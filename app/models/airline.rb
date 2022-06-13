class Airline < ApplicationRecord
  has_many :flights
  has_many :passenger_flights, through: :flights
  has_many :passengers, through: :passenger_flights

  validates_presence_of :name

  def adult_passengers
    passengers.where('age >= 18').distinct
  end

  def frequent_flyers
    adult_passengers.select('passengers.*, COUNT(passenger_flights) AS flight_count').group('passengers.id').order('flight_count DESC')
  end
end
