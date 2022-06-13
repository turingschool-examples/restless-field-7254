class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def unique_and_above_18
    passengers
    .select("passengers.name")
    .where("passengers.age > ?", 18)
    .order("passengers.name")
    .distinct
    .pluck("passengers.name")
  end
end
