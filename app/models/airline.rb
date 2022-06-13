class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def adult_passengers
    passengers
    .where("age >= ?", 18)
    .group("passengers.id")
    .order(Arel.sql("COUNT(passengers.id) DESC"))
  end
end
