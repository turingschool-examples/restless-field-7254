class CreateJoinTableFlightsPassengers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :flights, :passengers, table_name: :flight_passengers do |t|
       t.index [:flight_id, :passenger_id]
       t.index [:passenger_id, :flight_id]
    end
  end
end
