class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.group(:id)
    .where("age >= 18")
    .select("passengers.*, count(flights) as flight_count")
    .order(flight_count: :desc)
    .distinct
  end
end
