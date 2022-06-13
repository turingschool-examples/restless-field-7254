class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def passenger_names
    passengers.pluck(:name)
  end

  def flyable_passengers
    passengers.where(status: true)
  end

  def flyable_adults
    passengers.where(status: true)
    .where('age >= 18')
  end

  def flyable_adult_names
    flyable_adults.pluck(:name)
  end
end
