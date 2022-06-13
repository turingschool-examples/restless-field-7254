require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:flight_passengers).through(:flights) }
  it { should have_many(:passengers).through(:flight_passengers) }

  describe "instance methods" do
    before :each do
      @american = Airline.create!(name: 'American')
      @delta = Airline.create!(name: 'Delta')
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
      FlightPassenger.create!(flight: @flight_1, passenger: @bob)
      FlightPassenger.create!(flight: @flight_1, passenger: @jane)
      FlightPassenger.create!(flight: @flight_1, passenger: @alex)
      FlightPassenger.create!(flight: @flight_2, passenger: @bob)
      FlightPassenger.create!(flight: @flight_2, passenger: @mary)
      FlightPassenger.create!(flight: @flight_2, passenger: @tom)
      FlightPassenger.create!(flight: @flight_3, passenger: @bob)
      FlightPassenger.create!(flight: @flight_3, passenger: @joe)
    end

    it "finds all unqiue adult passengers for an airline " do
      expect(@american.find_adult_passengers).to eq([@bob, @jane, @alex, @mary])
      expect(@american.find_adult_passengers).to_not eq([@bob, @jane, @alex, @mary, @tom])
    end
    
  end
    
end