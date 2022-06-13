require 'rails_helper'

RSpec.describe Passenger, type: :model do

  it { should have_many :flight_passengers }
  it { should have_many(:flights).through(:flight_passengers) }

  before :each do
    @american = Airline.create!(name: 'American')
    @delta = Airline.create!(name: 'Delta')
    @southwest = Airline.create!(name: 'Southwest')
    @flight_1 = @american.flights.create!(number: '1', date: '01/01/2201', departure_city: "San Francisco", arrival_city: "New York City")
    @flight_2 = @american.flights.create!(number: '2', date: '01/01/2202', departure_city: "Dallas", arrival_city: "Denver")
    @flight_3 = @delta.flights.create!(number: '3', date: '01/01/2203', departure_city: "New Orleans", arrival_city: "Los Angeles")
    @flight_4 = @delta.flights.create!(number: '4', date: '01/01/2204', departure_city: "Charollete", arrival_city: "Seattle")
    @bob = Passenger.create!(name: 'Bob', age: 37)
    @jane = Passenger.create!(name: 'Jane', age: 30)
    @alex = Passenger.create!(name: 'Alex', age: 47)
    @mary = Passenger.create!(name: 'Mary', age: 52)
    @tom = Passenger.create!(name: 'Tom', age: 17)
    @joe = Passenger.create!(name: 'Joe', age: 23)
    @flight_pass_1 = FlightPassenger.create!(flight: @flight_1, passenger: @bob)
    @flight_pass_2 = FlightPassenger.create!(flight: @flight_1, passenger: @jane)
    FlightPassenger.create!(flight: @flight_1, passenger: @alex)
    FlightPassenger.create!(flight: @flight_2, passenger: @bob)
  end
  describe "instance methods" do
    it 'can find the flight_passeneger associated with a passenger and flight' do
      expect(@bob.find_flight_passenger(@flight_1.id)).to eq(@flight_pass_1)
      expect(@jane.find_flight_passenger(@flight_1.id)).to_not eq(@flight_pass_1)
    end
  end
  
end