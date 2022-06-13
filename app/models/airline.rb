class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  validates_presence_of :name

  def unique_adult_passengers
    # passengers.distinct.where("age >= 18")
    flights.joins(:passengers)
    .where("age >= 18")
    .select('passengers.*, COUNT(passengers.id) AS flight_count')
    .group('passengers.id')
    .order('flight_count DESC')
  end
end
