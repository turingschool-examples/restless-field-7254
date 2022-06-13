require "rails_helper"

RSpec.describe "flights index page" do
  it "shows all flight numbers, name of the airline, and the names of all passengers for that flight" do
    frontier = Airline.create!(name: "Frontier")
    southwest = Airline.create!(name: "Southwest")
    flight1 = frontier.flights.create!(number: "F234", date: "03/24/2022", departure_city: "Denver", arrival_city: "Los Angeles")
    flight2 = frontier.flights.create!(number: "F345", date: "03/25/2022", departure_city: "Denver", arrival_city: "Seattle")
    flight3 = southwest.flights.create!(number: "S456", date: "03/24/2022", departure_city: "Denver", arrival_city: "New Orleans")
    flight4 = southwest.flights.create!(number: "S567", date: "03/25/2022", departure_city: "Denver", arrival_city: "Dallas")
    passenger1 = flight1.passengers.create!(name: "Sarah Micheals", age: 22)
    passenger2 = flight1.passengers.create!(name: "Micheal Stevens", age: 34)
    passenger3 = flight2.passengers.create!(name: "Ray Charles", age: 67)
    passenger4 = flight2.passengers.create!(name: "Bernie Mac", age: 59)
    passenger5 = flight3.passengers.create!(name: "Shaq O'Niel", age: 50)
    passenger6 = flight3.passengers.create!(name: "Gary Smarts", age: 76)
    passenger7 = flight4.passengers.create!(name: "Flynn Rider", age: 24)
    passenger8 = flight4.passengers.create!(name: "Rapunzel", age: 23)

    visit "/flights"

    expect(page).to have_content("Flight: F234")
    expect(page).to have_content("Flight: F345")
    expect(page).to have_content("Flight: S456")
    expect(page).to have_content("Flight: S567")
    expect(page).to have_content("Frontier")
    expect(page).to have_content("Southwest")
    expect(page).to have_content("Sarah Micheals")
    expect(page).to have_content("Ray Charles")
    expect(page).to have_content("Gary Smarts")
    expect(page).to have_content("Flynn Rider")
  end

  it "is able to remove a passenger from that flight" do
    frontier = Airline.create!(name: "Frontier")
    southwest = Airline.create!(name: "Southwest")
    flight1 = frontier.flights.create!(number: "F234", date: "03/24/2022", departure_city: "Denver", arrival_city: "Los Angeles")
    flight2 = frontier.flights.create!(number: "F345", date: "03/25/2022", departure_city: "Denver", arrival_city: "Seattle")
    flight3 = southwest.flights.create!(number: "S456", date: "03/24/2022", departure_city: "Denver", arrival_city: "New Orleans")
    flight4 = southwest.flights.create!(number: "S567", date: "03/25/2022", departure_city: "Denver", arrival_city: "Dallas")
    passenger1 = flight1.passengers.create!(name: "Sarah Micheals", age: 22)
    passenger2 = flight1.passengers.create!(name: "Micheal Stevens", age: 34)
    passenger3 = flight2.passengers.create!(name: "Ray Charles", age: 67)
    passenger4 = flight2.passengers.create!(name: "Bernie Mac", age: 59)
    passenger5 = flight3.passengers.create!(name: "Shaq O'Niel", age: 50)
    passenger6 = flight3.passengers.create!(name: "Gary Smarts", age: 76)
    passenger7 = flight4.passengers.create!(name: "Flynn Rider", age: 24)
    passenger8 = flight4.passengers.create!(name: "Rapunzel", age: 23)

    visit "/flights"
    within("##{passenger2.id}") do
      expect(page).to have_content("Micheal Stevens")
      expect(page).to have_button("Remove Passenger")
      click_button "Remove Passenger"
    end
    expect(current_path).to eq("/flights")
    expect(page).to_not have_content("Micheal Stevens")
  end
end
