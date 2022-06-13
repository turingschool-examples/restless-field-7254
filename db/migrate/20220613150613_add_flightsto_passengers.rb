class AddFlightstoPassengers < ActiveRecord::Migration[5.2]
  def change
    add_reference :flights, :passenger, foreign_key: true
  end
end
