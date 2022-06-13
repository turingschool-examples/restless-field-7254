class Flight < ApplicationRecord
  belongs_to :airline

  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  validates_presence_of :number, :date, :departure_city, :arrival_city, :airline_id

  def airline_name
    airline.name
  end

end
