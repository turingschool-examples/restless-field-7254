class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def find_adult_passengers
    passengers.where("age >= 18").distinct
  end

  def sort_adult_passengers_by_flight_count
    passengers.joins(:flight_passengers)
              .select('passengers.*, count(flight_passengers.passenger_id) as count')
              .where("passengers.age >= 18")
              .group(:id)
              .order(count: :desc)
  end
  
  
end