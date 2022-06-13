require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should belong_to :airline }
  it { should have_many :flight_passengers }
  it { should have_many(:passengers).through(:flight_passengers) }

  describe "class methods" do
    before :each do
      @spirit = Airline.create!(name: "Spirit")
      @flight1 = @spirit.flights.create!(number: 123, date: "07/18/22",
        departure_city: "Chicago", arrival_city: "Houston")
      @bob = Passenger.create!(name: "Bob", age: 35)
      @joe = Passenger.create!(name: "Joe", age: 40)
      @carol = Passenger.create!(name: "Carol", age: 11)
      @rick = Passenger.create!(name: "Rick", age: 13)
      @shane = Passenger.create!(name: "Shane", age: 18)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @bob.id)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @joe.id)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @carol.id)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @rick.id)
      FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @shane.id)
    end
    it "#only_adults only returns passengers greater or equal to 18 in age" do
      expect(@flight1.only_adults).to eq([@bob, @joe, @shane])
    end
  end
end