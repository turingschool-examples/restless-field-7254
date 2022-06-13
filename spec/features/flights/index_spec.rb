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
end
