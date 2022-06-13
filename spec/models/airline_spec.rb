require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }

  describe 'instance methods' do
    it 'returns a list of unique adult passengers'do
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
      jes = Passenger.create!(name: "Jes", age: 19)
      nadine = Passenger.create!(name: "Nadine", age: 8)

      FlightPassenger.create!(flight: flight1, passenger: mike)
      FlightPassenger.create!(flight: flight1, passenger: jeni)
      FlightPassenger.create!(flight: flight1, passenger: theo)
      FlightPassenger.create!(flight: flight2, passenger: jeni)
      FlightPassenger.create!(flight: flight2, passenger: theo)
      FlightPassenger.create!(flight: flight3, passenger: jordan)
      FlightPassenger.create!(flight: flight4, passenger: jordan)
      FlightPassenger.create!(flight: flight4, passenger: jes)
      FlightPassenger.create!(flight: flight4, passenger: nadine)

    expect(frontier.unique_adults).to eq(["Jeni", "Mike"])
    expect(frontier.unique_adults).to_not eq(["Theo"])

    expect(united.unique_adults).to eq(["Jes", "Jordan"])
    expect(frontier.unique_adults).to_not eq(["Nadine"])
    end
  end
end
