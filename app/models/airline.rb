class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def flyable_adult_names
    passengers.where('passengers.age >= 18')
    .where('passengers.status = true')
    .distinct('passengers.name')
    .pluck('passengers.name')
  end
end
