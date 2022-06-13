class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def age_limiter
    # binding.pry
    passengers.where('age >= ?', 18).distinct
    #joins to get access to group and aggregate by number of flights the passenger has taken?
  end
end