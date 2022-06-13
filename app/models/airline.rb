class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def airline_adult_passengers
    passengers.where('age >= 18')
              .distinct
  end

  def airline_adult_passengers_ordered
    passengers.where('age >= 18')
              .group(:id)
              .order('count(flights.id) DESC')
  end
end
