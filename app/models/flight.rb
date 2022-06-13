class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers, dependent: :destroy
  has_many :passengers, through: :flight_passengers

  def only_adults
    passengers.where('passengers.age >= 18')
  end
end