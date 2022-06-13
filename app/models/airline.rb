class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def passengers_over_18_by_frequency
    passengers.select('passengers.name, count(*) as count').group(:id).order(count: :desc).where("passengers.age >= 18")
  end

end
