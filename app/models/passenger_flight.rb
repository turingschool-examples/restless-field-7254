class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight
  has_many :airlines, through: :flight
end
