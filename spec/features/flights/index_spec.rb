require 'rails_helper'

RSpec.describe 'the Flight Index page', type: :feature do
  it 'lists all flight numbers' do
    frontier = Airline.create!(name: "Frontier")
    united = Airline.create!(name: "United")

    flight1 = frontier.flights.create!(number: 1234, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    flight2 = frontier.flights.create!(number: 4567, date: "08/15/20", departure_city: "Sacramento", arrival_city: "Raleigh")
    flight3 = united.flights.create!(number: 7891, date: "08/15/20", departure_city: "Denver", arrival_city: "Portland")
    flight4 = united.flights.create!(number: 4321, date: "08/16/20", departure_city: "Denver", arrival_city: "Dallas")

    visit "/flights"
    expect(page).to have_content("All Flight Numbers:")
    expect(page).to have_content(1234)
    expect(page).to have_content(4567)
    expect(page).to have_content(7891)
    expect(page).to have_content(4321)
    expect(page).to_not have_content(1000)
    expect(page).to_not have_content(2000)
  end

  it 'displays name of airline next to flight number' do
    frontier = Airline.create!(name: "Frontier")
    united = Airline.create!(name: "United")

    flight1 = frontier.flights.create!(number: 1234, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    flight2 = frontier.flights.create!(number: 4567, date: "08/15/20", departure_city: "Sacramento", arrival_city: "Raleigh")
    flight3 = united.flights.create!(number: 7891, date: "08/15/20", departure_city: "Denver", arrival_city: "Portland")
    flight4 = united.flights.create!(number: 4321, date: "08/16/20", departure_city: "Denver", arrival_city: "Dallas")

    visit "/flights"
      within("#flight-#{flight1.id}") do
        expect(page).to have_content("Frontier")
        expect(page).to_not have_content("United")
      end
      within("#flight-#{flight2.id}") do
        expect(page).to have_content("Frontier")
        expect(page).to_not have_content("United")
      end
      within("#flight-#{flight3.id}") do
        expect(page).to have_content("United")
        expect(page).to_not have_content("Frontier")
      end
      within("#flight-#{flight4.id}") do
        expect(page).to have_content("United")
        expect(page).to_not have_content("Frontier")
      end
  end

  it 'displays name of all passengers for each flight' do
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

    visit "/flights"
      within("#flight-#{flight1.id}") do
        expect(page).to have_content("Mike")
        expect(page).to have_content("Dani")
        expect(page).to_not have_content("Jeni")
      end
      within("#flight-#{flight2.id}") do
        expect(page).to have_content("Jeni")
        expect(page).to have_content("Theo")
        expect(page).to_not have_content("Jordan")
      end
      within("#flight-#{flight3.id}") do
        expect(page).to have_content("Jordan")
        expect(page).to_not have_content("Jes")
        expect(page).to_not have_content("Nadine")
      end
      within("#flight-#{flight4.id}") do
        expect(page).to have_content("Jes")
        expect(page).to have_content("Nadine")
        expect(page).to_not have_content("Mike")
      end
  end

  it 'has form to remove a passenger from a flight' do
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

    visit "/flights"
      within("#flight-#{flight1.id}") do
        expect(page).to have_content("Mike")
          within("#passenger-#{mike.id}")do
          click_button "Remove #{mike.name}"
        end
        expect(current_path).to eq("/flights")
        expect(page).to have_content("Dani")
        expect(page).to_not have_content("Mike")
      end
  end
end
