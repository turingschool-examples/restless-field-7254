class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def passengers_over_18
    passengers.where("passengers.age >= 18")
  end
end
