class Airline < ApplicationRecord
  has_many :flights


  def all_adult_passengers
    flights.joins(passengers: :passenger_flights)
            .where('passengers.age >= ?', 18)
            .select('passengers.*')
            .distinct
            .order(:name)
  end
end
