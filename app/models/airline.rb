class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adult_passengers
    wip = passengers.where("age > 17")
                    .group(:id)
                    .select("passengers.*, count(passengers.id) AS num_flights")
                    .order(num_flights: :desc)
  end
end