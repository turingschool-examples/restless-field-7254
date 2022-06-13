require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  # it { should have_many(:flight_passengers).through(:flights) }
  # it { should have_many(:passengers).through(:flight_passengers) }

  describe 'class methods' do
    it 'can show unique list of adult passengers' do
      frontier = Airline.create!(name: "Frontier")
      flight1 = frontier.flights.create!(number: "F234", date: "03/24/2022", departure_city: "Denver", arrival_city: "Los Angeles")
      flight2 = frontier.flights.create!(number: "F345", date: "03/25/2022", departure_city: "Denver", arrival_city: "Seattle")
      passenger1 = flight1.passengers.create!(name: "Sarah Micheals", age: 17)
      passenger2 = flight1.passengers.create!(name: "Micheal Stevens", age: 34)
      passenger2 = flight2.passengers.create!(name: "Micheal Stevens", age: 34)
      passenger3 = flight2.passengers.create!(name: "Ray Charles", age: 67)
      passenger4 = flight2.passengers.create!(name: "Bernie Mac", age: 59)
      passenger4 = flight2.passengers.create!(name: "Susie Overman", age: 16)

      expect(Airline.adult_passengers).to eq([passenger2, passenger3, passenger4])
    end
  end
end
