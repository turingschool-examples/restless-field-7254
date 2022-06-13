require 'rails_helper'

RSpec.describe 'Flights Index Page', type: :feature do
  describe "User Story 1" do
    it "displays all Flights, and their airline" do
      air1 = Airline.create!(name: "Big Sky")
      fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
      fly2 = air1.flights.create!(number: "208", date: "06/16/22", arrival_city: "Geneva", departure_city: "Houston")

      air2 = Airline.create!(name: "Denta")
      fly3 = air2.flights.create!(number: "444", date: "06/16/22", arrival_city: "Langston", departure_city: "Tampa")
      fly4 = air2.flights.create!(number: "101", date: "06/16/22", arrival_city: "Tampa", departure_city: "Santa Fe")

      sally = Passenger.create!(name: "Sally", age: 20)
      sam = Passenger.create!(name: "Sam", age: 10)
      scott = Passenger.create!(name: "Scott", age: 18)
      susan = Passenger.create!(name: "Susan", age: 43)
      luke = Passenger.create!(name: "Luke", age: 31)
      liam = Passenger.create!(name: "Liam", age: 2)
      lindsey = Passenger.create!(name: "Lindsey", age: 40)
      laura = Passenger.create!(name: "Laura", age: 40)

      flypass1 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sally.id)
      flypass2 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sam.id)
      flypass3 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: scott.id)
      flypass4 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: susan.id)
      flypass5 = FlightPassenger.create!(flight_id: fly3.id, passenger_id: luke.id)
      flypass6 = FlightPassenger.create!(flight_id: fly3.id, passenger_id: liam.id)
      flypass7 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: lindsey.id)
      flypass8 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: laura.id)

      visit flights_path

      within ".all_flights" do
        expect(page).to have_content("Flight: 177")
        expect(page).to have_content("Flight: 208")
        expect(page).to have_content("Big Sky")

        expect(page).to have_content("Flight: 444")
        expect(page).to have_content("Flight: 101")
        expect(page).to have_content("Denta")
      end

      within "#flight-#{fly1.id}" do
        expect(page).to have_content("Passengers: Sally, Sam")
      end
    end
  end

  describe "User Story 2" do
    it "has a link to remove passenger from flight" do
      air1 = Airline.create!(name: "Big Sky")
      fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
      fly2 = air1.flights.create!(number: "208", date: "06/16/22", arrival_city: "Geneva", departure_city: "Houston")

      air2 = Airline.create!(name: "Denta")
      fly3 = air2.flights.create!(number: "444", date: "06/16/22", arrival_city: "Langston", departure_city: "Tampa")
      fly4 = air2.flights.create!(number: "101", date: "06/16/22", arrival_city: "Tampa", departure_city: "Santa Fe")

      sally = Passenger.create!(name: "Sally", age: 20)
      sam = Passenger.create!(name: "Sam", age: 10)
      scott = Passenger.create!(name: "Scott", age: 18)
      susan = Passenger.create!(name: "Susan", age: 43)
      luke = Passenger.create!(name: "Luke", age: 31)
      liam = Passenger.create!(name: "Liam", age: 2)
      lindsey = Passenger.create!(name: "Lindsey", age: 40)
      laura = Passenger.create!(name: "Laura", age: 40)

      flypass1 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sally.id)
      flypass2 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sam.id)
      flypass3 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: scott.id)
      flypass4 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: susan.id)
      flypass5 = FlightPassenger.create!(flight_id: fly3.id, passenger_id: luke.id)
      flypass6 = FlightPassenger.create!(flight_id: fly3.id, passenger_id: liam.id)
      flypass7 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: lindsey.id)
      flypass8 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: laura.id)

      visit flights_path

      within "#passenger-#{sally.id}" do
        expect(page).to have_button("Remove Passenger")
        click_button
      end

      within "#flight-#{fly1.id}" do
        expect(page).to_not have_content("Sally")
      end
    end
  end
end
