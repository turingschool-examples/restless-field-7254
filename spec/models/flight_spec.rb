require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should belong_to :airline }
  it { should have_many :flight_passengers}
  it { should have_many(:passengers).through(:flight_passengers)}

  describe 'instance methods' do
    it 'can get all passenger names for a fligt' do
      frontier = Airline.create!(name: "Frontier")
      united = Airline.create!(name: "United")

      flight1 = frontier.flights.create!(number: 1234, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
      flight2 = frontier.flights.create!(number: 4567, date: "08/15/20", departure_city: "Sacramento", arrival_city: "Raleigh")
      flight3 = united.flights.create!(number: 7891, date: "08/15/20", departure_city: "Denver", arrival_city: "Portland")
      flight4 = united.flights.create!(number: 4321, date: "08/16/20", departure_city: "Denver", arrival_city: "Dallas")

      mike = Passenger.create!(name: "Mike", age: 40)
      dani = Passenger.create!(name: "Dani", age: 35)
      jeni = Passenger.create!(name: "Jeni", age: 34)
      theo = Passenger.create!(name: "Theo", age: 5)
      jordan = Passenger.create!(name: "Jordan", age: 38)
      jes = Passenger.create!(name: "Jes", age: 17)
      nadine = Passenger.create!(name: "Nadine", age: 8)

      FlightPassenger.create!(flight: flight1, passenger: mike)
      FlightPassenger.create!(flight: flight1, passenger: dani)
      FlightPassenger.create!(flight: flight2, passenger: jeni)
      FlightPassenger.create!(flight: flight2, passenger: theo)
      FlightPassenger.create!(flight: flight3, passenger: jordan)
      FlightPassenger.create!(flight: flight4, passenger: jes)
      FlightPassenger.create!(flight: flight4, passenger: nadine)

      expect(flight1.all_passenger_names).to eq(["Mike", "Dani"])
      expect(flight2.all_passenger_names).to eq(["Jeni", "Theo"])
      expect(flight3.all_passenger_names).to eq(["Jordan"])
      expect(flight4.all_passenger_names).to eq(["Jes", "Nadine"])
    end
  end
end
