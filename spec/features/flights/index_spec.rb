require 'rails_helper'

RSpec.describe "Flight Index Page", type: :feature do
  it "can list all flight numbers with the airline and flights passengers" do
    airline1 = Airline.create(name: "Delta")
    airline2 = Airline.create(name: "American")
    flight1 = airline1.flights.create(number: 1427, date: "19 November 2022", departure_city: "Albuquerque", arrival_city: "Denver")
    flight2 = airline1.flights.create(number: 1276, date: "20 November 2022", departure_city: "San Diego", arrival_city: "Washington D.C")
    flight3 = airline2.flights.create(number: 1742, date: "21 November 2022", departure_city: "San Francisco", arrival_city: "Skypeia")
    passenger1 = flight1.passengers.create(name: "Joe", age: 25)
    passenger2 = flight1.passengers.create(name: "Eliza", age: 21)
    passenger3 = flight2.passengers.create(name: "Dunkin", age: 35)
    passenger4 = flight3.passengers.create(name: "Albert", age: 52)

    visit '/flights'

    within "#flights-#{flight1.id}" do
      expect(page).to have_content("Flight Number: 1427")
      expect(page).to have_content("Airline: Delta")
      expect(page).to have_content("Passenger: Joe")
      expect(page).to_not have_content("Airline: American")
      expect(page).to_not have_content("Passenger: Dunkin")
      expect(page).to_not have_content("Passenger: Albert")
    end

    within "#flights-#{flight2.id}" do
      expect(page).to have_content("Flight Number: 1276")
      expect(page).to have_content("Airline: Delta")
      expect(page).to have_content("Passenger: Dunkin")
      expect(page).to_not have_content("Passenger: Albert")
      expect(page).to_not have_content("Passenger: Joe")
      expect(page).to_not have_content("Passenger: Eliza")
      expect(page).to_not have_content("Airline: American")
    end

    within "#flights-#{flight3.id}" do
      expect(page).to have_content("Flight Number: 1742")
      expect(page).to have_content("Airline: American")
      expect(page).to have_content("Passenger: Albert")
      expect(page).to_not have_content("Passenger: Dunkin")
      expect(page).to_not have_content("Passenger: Joe")
      expect(page).to_not have_content("Passenger: Eliza")
      expect(page).to_not have_content("Airline: Delta")
    end
  end

  xit "can has a link to remove a passenger from a flight" do
    airline1 = Airline.create(name: "Delta")
    flight1 = airline1.flights.create(number: 1427, date: "19 November 2022", departure_city: "Albuquerque", arrival_city: "Denver")
    flight2 = airline1.flights.create(number: 1276, date: "20 November 2022", departure_city: "San Diego", arrival_city: "Washington D.C")
    passenger1 = flight1.passengers.create(name: "Joe", age: 25)
    passenger2 = flight1.passengers.create(name: "Eliza", age: 21)

    visit '/flights'

    within "#flights-#{flight1.id}" do
      expect(passenger1.status).to eq("added")
      expect(page).to have_link("Remove #{passenger1.name}")
      expect(page).to have_link("Remove #{passenger2.name}")
      click_on "Remove #{passenger1.name}"
      expect(current_path).to eq("/flights")
      passenger1.reload

      expect(page).to have_content("Passenger: #{passenger2.name}")
      expect(page).to_not have_content("Passenger: #{passenger1.name}")
    end

    within '#removed-passengers' do
      expect(page).to have_content("Passenger: Joe")
    end
  end
end
