require 'rails_helper'

RSpec.describe "Airlines Show Page", type: :feature do
  it "lists only adults passengers" do
    air1 = Airline.create!(name: "Big Sky")
    fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
    fly2 = air1.flights.create!(number: "208", date: "06/16/22", arrival_city: "Geneva", departure_city: "Houston")
    fly3 = air1.flights.create!(number: "444", date: "06/16/22", arrival_city: "Langston", departure_city: "Tampa")
    fly4 = air1.flights.create!(number: "101", date: "06/16/22", arrival_city: "Tampa", departure_city: "Santa Fe")

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
    flypass9 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: sam.id)
    flypass10 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: sally.id)
    # Sam and Sally appear on two separate flights, only show their names once
    # Sam and Liam are the only children, and are not listed

    visit airline_path(air1)

    expect(page).to have_content("Passengers: Sally, Scott, Susan, Luke, Lindsey, Laura")
  end
end
