class Airline < ApplicationRecord
  has_many :flights


  def all_adult_passengers
    flights.joins(passengers: :passenger_flights)
            .where('passengers.age >= ?', 18)
            .select('passengers.*')
            .distinct
            .order(:name)
  end

  def all_adult_passengers_sorted
    flights.joins(passengers: :passenger_flights)
            .where('passengers.age >= ?', 18)
            .select('passengers.*, count(passenger_flights.passenger_id = passengers.id)')
            .group('passengers.id')
            .order(count: :desc, name: :asc)
  end
end
