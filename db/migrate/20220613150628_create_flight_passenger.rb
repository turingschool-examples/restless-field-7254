class CreateFlightPassenger < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_passengers do |t|
      t.references :passenger, foreign_key: true
      t.references :flight, foreign_key: true
    end
  end
end
