require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe 'vailidations' do
    it {should validate_presence_of :name}
  end

  describe 'instance methods' do
    before do
      @airline1 = Airline.create!(name: "JetBlue")
      @airline2 = Airline.create!(name: "Hawaiian")

      @flight1 = @airline1.flights.create!(number: 1, date: "5/19/22", arrival_city: "NYC", departure_city: "San Fran")
      @flight2 = @airline1.flights.create!(number: 2, date: "5/23/22", arrival_city: "Honolulu", departure_city: "Denver")
      @flight3 = @airline1.flights.create!(number: 3, date: "5/23/22", arrival_city: "Detroit", departure_city: "Orlando")

      @pass1 = Passenger.create!(name: "Jenn", age: 29)
      @pass2 = Passenger.create!(name: "Eric", age: 18)
      @pass3 = Passenger.create!(name: "Liz", age: 16)
      @pass4 = Passenger.create!(name: "Rory", age: 32)

      FlightPassenger.create!(flight: @flight1, passenger: @pass1)
      FlightPassenger.create!(flight: @flight2, passenger: @pass1)
      FlightPassenger.create!(flight: @flight3, passenger: @pass1)
      FlightPassenger.create!(flight: @flight1, passenger: @pass2)
      FlightPassenger.create!(flight: @flight2, passenger: @pass2)
      FlightPassenger.create!(flight: @flight1, passenger: @pass3)
      FlightPassenger.create!(flight: @flight1, passenger: @pass4)

    end

    describe 'unique_adult_passengers' do
      it "returns a unique list of passengers 18 years of age or older" do
        
        expect(@airline1.unique_adult_passengers.first.name).to eq("Jenn")
        expect(@airline1.unique_adult_passengers.second.name).to eq("Eric")
        expect(@airline1.unique_adult_passengers.last.name).to eq("Rory")
        expect(@airline1.unique_adult_passengers.length).to eq(3)
      end
    end
  end
end
