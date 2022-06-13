class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  def self.remove_passenger(pass_id, fli_id)
    where(passenger_id: pass_id, flight_id: fli_id)
    .delete(1)

  end
end
