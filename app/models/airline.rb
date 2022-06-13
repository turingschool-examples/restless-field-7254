class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights


  def only_adults
    passengers.where('passengers.age >= 18').distinct
  end

  def frequent_flyers
    passengers.joins(:flights)
              .where('passengers.age >= 18')
              .select('passengers.*, count(passengers.id) AS passenger_flights')
              .group('passengers.id')
              .order(passenger_flights: :desc)
  end
end