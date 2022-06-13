class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def distinct_adult_passengers
    passengers
    .where('age >= ?', '18')
    .select('name')
    .distinct
    .pluck(:name)
  end

  def adult_passengers_by_flights
    passengers
    .where('age >= ?', '18')
    .select('passengers.* , count(flights) as flight_count')
    .group(:id)
    .order(flight_count: :desc)
  end
end
