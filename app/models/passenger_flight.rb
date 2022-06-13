class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  def self.remove_passenger(pass_id, fli_id)
    all.where(passenger_id: pass_id)
       .where(flight_id: fli_id)
       .first
       .delete
  end
end
