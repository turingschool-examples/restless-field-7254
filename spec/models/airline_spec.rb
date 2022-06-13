require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }

  it "shows flyable adult names" do
    air1 = Airline.create!(name: "Big Sky")
    fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
    fly2 = air1.flights.create!(number: "208", date: "06/16/22", arrival_city: "Geneva", departure_city: "Houston")
    sally = Passenger.create!(name: "Sally", age: 21)
    sam = Passenger.create!(name: "Sam", age: 10)
    flypass1 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sally.id)
    flypass2 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sam.id)
    flypass2 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: sally.id)

    expect(air1.flyable_adult_names).to eq(["Sally"])
  end

  it "lists frequent fliers" do
    air1 = Airline.create!(name: "Big Sky")
    fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
    fly2 = air1.flights.create!(number: "208", date: "06/16/22", arrival_city: "Geneva", departure_city: "Houston")
    sally = Passenger.create!(name: "Sally", age: 21)
    sam = Passenger.create!(name: "Sam", age: 18)
    flypass1 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sally.id)
    flypass2 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sam.id)
    flypass2 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: sally.id)
require "pry"; binding.pry
    expect(air1.frequent_fliers).to eq([sally, sam])
  end
end
