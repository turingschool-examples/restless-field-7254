class Passenger < ApplicationRecord
  has_many :flights
  enum status: ["added", "removed"]
end
