class Airline < ApplicationRecord
  has_many :flights

  def self.adult_passengers
    # require "pry"; binding.pry
    Passenger.joins(:flights)
      .where("passengers.age > ?", "18")
      .select("passengers.*")
      .group(:id)
      .distinct

  end
end
