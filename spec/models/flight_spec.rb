require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should belong_to :airline }
  it { should have_many(:flight_passengers) }
  it { should have_many(:passengers).through(:flight_passengers) }

  it "plucks passenger names" do
    air1 = Airline.create!(name: "Big Sky")
    fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
    sally = Passenger.create!(name: "Sally")
    sam = Passenger.create!(name: "Sam")
    flypass1 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sally.id)
    flypass2 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sam.id)

    expect(fly1.passenger_names).to eq(["Sally", "Sam"])
  end

  it "show flyable passengers" do
    air1 = Airline.create!(name: "Big Sky")
    fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
    sally = Passenger.create!(name: "Sally", age: 21)
    sam = Passenger.create!(name: "Sam", age: 10, status: false)
    flypass1 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sally.id)
    flypass2 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sam.id)

    expect(fly1.flyable_passengers).to eq([sally])
  end
end
