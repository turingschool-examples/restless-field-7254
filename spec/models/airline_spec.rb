require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights)}
end

  describe "#instance methods" do
    it "can will only display customers that are unique and over 18" do
      airline1 = Airline.create(name: "Delta")
      airline2 = Airline.create(name: "American")
      flight1 = airline1.flights.create(number: 1427, date: "19 November 2022", departure_city: "Albuquerque", arrival_city: "Denver")
      flight2 = airline1.flights.create(number: 1276, date: "20 November 2022", departure_city: "San Diego", arrival_city: "Washington D.C")
      flight3 = airline2.flights.create(number: 1742, date: "21 November 2022", departure_city: "San Francisco", arrival_city: "Skypeia")
      passenger1 = flight1.passengers.create(name: "Joe", age: 25)
      passenger2 = flight1.passengers.create(name: "Joe", age: 25)
      passenger3 = flight1.passengers.create(name: "Kid", age: 17)
      passenger4 = flight1.passengers.create(name: "Eliza", age: 21)
      passenger5 = flight2.passengers.create(name: "Dunkin", age: 35)
      passenger6 = flight3.passengers.create(name: "Albert", age: 52)

    expect(airline1.unique_and_above_18).to eq([passenger1, passenger4])
  end
end
