class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def airline_passengers
    wip = self.passengers
    .where("passengers.age >= 18")
    .distinct
  end
end
