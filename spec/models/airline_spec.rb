require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many(:flights) }
    it { should have_many(:passenger_flights).through(:flights) }
    it { should have_many(:passengers).through(:passenger_flights) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  let!(:airline_1) { Airline.create!(name: "Delta") }

  let!(:flight_1) { airline_1.flights.create!(number: "7990", date: "08/03/20", departure_city: "Denver", arrival_city: "Chicago") }
  let!(:flight_2) { airline_1.flights.create!(number: "3940", date: "02/17/20", departure_city: "Miami", arrival_city: "Tulsa") }
  let!(:flight_3) { airline_1.flights.create!(number: "9091", date: "11/25/20", departure_city: "Salt Lake City", arrival_city: "Seattle") }
  let!(:flight_4) { airline_1.flights.create!(number: "1234", date: "12/25/20", departure_city: "Seattle", arrival_city: "San Francisco") }

  let!(:passenger_1) { Passenger.create!(name: "Brennan Lee Mulligan", age: 13) }
  let!(:passenger_2) { Passenger.create!(name: "Abria Iyengar", age: 9) }
  let!(:passenger_3) { Passenger.create!(name: "Bill Seacaster", age: 46) }
  let!(:passenger_4) { Passenger.create!(name: "Misty Moore", age: 18) }
  let!(:passenger_5) { Passenger.create!(name: "Kingston Brown", age: 84) }

  let!(:pass_flight_1) { PassengerFlight.create!(passenger: passenger_1, flight: flight_1) }
  let!(:pass_flight_2) { PassengerFlight.create!(passenger: passenger_2, flight: flight_2) }
  let!(:pass_flight_3) { PassengerFlight.create!(passenger: passenger_3, flight: flight_1) }
  let!(:pass_flight_4) { PassengerFlight.create!(passenger: passenger_3, flight: flight_3) }
  let!(:pass_flight_5) { PassengerFlight.create!(passenger: passenger_4, flight: flight_4) }
  let!(:pass_flight_6) { PassengerFlight.create!(passenger: passenger_4, flight: flight_2) }
  let!(:pass_flight_7) { PassengerFlight.create!(passenger: passenger_4, flight: flight_3) }
  let!(:pass_flight_8) { PassengerFlight.create!(passenger: passenger_5, flight: flight_3) }

  describe '#adult_passengers' do
    it "returns a unique list of adult passengers (18 years old or above) that have flights with a specific airline" do
      expect(airline_1.adult_passengers).to eq([passenger_3, passenger_4, passenger_5])
    end
  end

  describe '#frequent_flyers' do
    it "returns a list of adult passengers sorted by the number of flights each passenger has taken on the airline from most to least" do
      expect(airline_1.frequent_flyers).to eq([passenger_4, passenger_3, passenger_5])
      expect(airline_1.frequent_flyers[0].flights.count).to eq(3)
      expect(airline_1.frequent_flyers[1].flights.count).to eq(2)
      expect(airline_1.frequent_flyers[2].flights.count).to eq(1)
    end
  end
end
