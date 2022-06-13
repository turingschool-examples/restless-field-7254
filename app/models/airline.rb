class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    flights.joins(:passengers)
           .where("passengers.age > 17")
           .distinct
           .group("passengers.id")
           .select("passengers.*, count(passengers.id) AS num_flights")
           .order(num_flights: :desc)
  end
end