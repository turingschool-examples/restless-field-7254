require "rails_helper"

RSpec.describe "airlines show page" do
  it 'shows a list of unique adult (18 up) passengers that have flights on that airline' do
    frontier = Airline.create!(name: "Frontier")
    flight1 = frontier.flights.create!(number: "F234", date: "03/24/2022", departure_city: "Denver", arrival_city: "Los Angeles")
    flight2 = frontier.flights.create!(number: "F345", date: "03/25/2022", departure_city: "Denver", arrival_city: "Seattle")
    passenger1 = flight1.passengers.create!(name: "Sarah Micheals", age: 17)
    passenger2 = flight1.passengers.create!(name: "Micheal Stevens", age: 34)
    passenger2 = flight2.passengers.create!(name: "Micheal Stevens", age: 34)
    passenger3 = flight2.passengers.create!(name: "Ray Charles", age: 67)
    passenger4 = flight2.passengers.create!(name: "Bernie Mac", age: 59)
    passenger4 = flight2.passengers.create!(name: "Susie Overman", age: 16)

    visit "/airlines/#{frontier.id}"

    expect(page).to have_content("Micheal Stevens")
    expect(page).to have_content("Ray Charles")
    expect(page).to have_content("Bernie Mac")
    expect(page).to_not have_content("Sarah Micheals")
    expect(page).to_not have_content("Susie Overman")
  end
end
