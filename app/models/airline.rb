class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.where("age > '18'")
              .distinct('name')
  end

  def frequent_adult_flyers
    passengers.select('passengers.*, count(passenger_flights) total_passenger_flights_count')
              .where("age > '18'")
              .joins(:airlines)
              .group('passengers.id')
              .order(total_passenger_flights_count: :desc)
              .distinct('name')
  end
end

