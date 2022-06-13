require 'rails_helper'

RSpec.describe "Airline Show Page", type: :feature do
  it "can list all flight numbers with the airline and flights passengers" do
  airline1 = Airline.create(name: "Delta")
  airline2 = Airline.create(name: "American")
  flight1 = airline1.flights.create(number: 1427, date: "19 November 2022", departure_city: "Albuquerque", arrival_city: "Denver")
  flight2 = airline1.flights.create(number: 1276, date: "20 November 2022", departure_city: "San Diego", arrival_city: "Washington D.C")
  flight3 = airline2.flights.create(number: 1742, date: "21 November 2022", departure_city: "San Francisco", arrival_city: "Skypeia")
  passenger1 = flight1.passengers.create(name: "Joe", age: 25)
  passenger2 = flight1.passengers.create(name: "Kid", age: 17)
  passenger3 = flight1.passengers.create(name: "Eliza", age: 21)
  passenger4 = flight2.passengers.create(name: "Dunkin", age: 35)
  passenger5 = flight3.passengers.create(name: "Albert", age: 52)

  visit "/airlines/#{airline1.id}"

  expect(page).to have_content("Passenger: Joe")
  expect(page).to have_content("Passenger: Eliza")
  expect(page).to have_content("Passenger: Dunkin")
  expect(page).to_not have_content("Albert")
  expect(page).to_not have_content("Kid")
  end
end
