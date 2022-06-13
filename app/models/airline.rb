class Airline < ApplicationRecord
  has_many :flights
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.select('passengers.name, count(*) as count')
              .group(:id)
              .order(count: :desc)
              .where('passengers.age >= 18')
  end
end
