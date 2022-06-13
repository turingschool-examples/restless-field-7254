require 'rails_helper'

RSpec.describe 'the Airline Show page', type: :feature do
  it 'displays a unique list of adult passengers for each airline' do
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

    visit "/airlines/#{frontier.id}"

    expect(page).to have_content("Mike")
    expect(page).to have_content("Jeni")
    expect(page).to_not have_content("Theo")
    expect(page).to_not have_content("Jordan")
  end

  it 'displays unique list of adult passengers for each airline test 2' do
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

    visit "/airlines/#{united.id}"

    expect(page).to have_content("Jordan")
    expect(page).to have_content("Jes")
    expect(page).to_not have_content("Nadine")
    expect(page).to_not have_content("Jeni")
  end
end
