require 'rails_helper'

RSpec.describe "Airline Show View", type: :feature do
  describe "User Story 3, Airline's Passengers" do
    let!(:passenger1) { Passenger.create(name: "Brennan Lee Mulligan", age: 13) }
    let!(:passenger2) { Passenger.create(name: "Aabria Iyengar", age: 9) }
    let!(:passenger3) { Passenger.create(name: "Bill Seacaster", age: 46) }
    let!(:passenger4) { Passenger.create(name: "Misty Moore", age: 44) }
    let!(:passenger5) { Passenger.create(name: "Kingston Brown", age: 84) }

    let!(:passenger6) { Passenger.create(name: "Uncle Carbuncle", age: 99) }

    let!(:american) { Airline.create(name: "American") }
    let!(:delta) { Airline.create(name: "Delta") }
    let!(:jetblue) { Airline.create(name: "JetBlue") }
    let!(:southwest) { Airline.create(name: "Southwest") }
    let!(:united) { Airline.create(name: "United") }

    let!(:flight1) { Flight.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: american) }
    let!(:flight2) { Flight.create(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: delta) }
    let!(:flight3) { Flight.create(number: "9091", date:  "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: jetblue) }
    let!(:flight4) { Flight.create(number: "6798", date:  "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: southwest) }
    let!(:flight5) { Flight.create(number: "9665", date:  "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: united) }

    let!(:flight6) { Flight.create(number: "4242", date:  "11/13/2022", departure_city: "Los Angeles", arrival_city: "Denver", airline: american) }

    let!(:flight_passenger1) { FlightPassenger.create(flight: flight1, passenger: passenger1) }
    let!(:flight_passenger2) { FlightPassenger.create(flight: flight2, passenger: passenger2) }
    let!(:flight_passenger3) { FlightPassenger.create(flight: flight3, passenger: passenger3) }
    let!(:flight_passenger4) { FlightPassenger.create(flight: flight4, passenger: passenger4) }
    let!(:flight_passenger5) { FlightPassenger.create(flight: flight5, passenger: passenger5) }
    let!(:flight_passenger6) { FlightPassenger.create(flight: flight1, passenger: passenger2) }
    let!(:flight_passenger7) { FlightPassenger.create(flight: flight2, passenger: passenger3) }
    let!(:flight_passenger8) { FlightPassenger.create(flight: flight3, passenger: passenger4) }
    let!(:flight_passenger9) { FlightPassenger.create(flight: flight4, passenger: passenger5) }
    let!(:flight_passenger10) { FlightPassenger.create(flight: flight5, passenger: passenger1) }
    let!(:flight_passenger11) { FlightPassenger.create(flight: flight1, passenger: passenger3) }
    let!(:flight_passenger12) { FlightPassenger.create(flight: flight2, passenger: passenger4) }
    let!(:flight_passenger13) { FlightPassenger.create(flight: flight3, passenger: passenger5) }
    let!(:flight_passenger14) { FlightPassenger.create(flight: flight4, passenger: passenger1) }
    let!(:flight_passenger15) { FlightPassenger.create(flight: flight5, passenger: passenger2) }
    let!(:flight_passenger16) { FlightPassenger.create(flight: flight1, passenger: passenger4) }
    let!(:flight_passenger17) { FlightPassenger.create(flight: flight2, passenger: passenger5) }
    let!(:flight_passenger18) { FlightPassenger.create(flight: flight3, passenger: passenger1) }
    let!(:flight_passenger19) { FlightPassenger.create(flight: flight4, passenger: passenger2) }
    let!(:flight_passenger20) { FlightPassenger.create(flight: flight5, passenger: passenger3) }

    let!(:flight_passenger21) { FlightPassenger.create(flight: flight6, passenger: passenger6) }
    let!(:flight_passenger22) { FlightPassenger.create(flight: flight6, passenger: passenger2) }
    let!(:flight_passenger23) { FlightPassenger.create(flight: flight6, passenger: passenger3) }
    # As a visitor
    # When I visit an airline's show page
    # Then I see a list of passengers that have flights on that airline
    # And I see that this list is unique (no duplicate passengers)
    # And I see that this list only includes adult passengers
    # (Note: an adult is anyone with age greater than or equal to 18)
    it "shows a unique list of only adult passengers for that airline" do
      visit "/airlines/#{american.id}"

      expect(page).to have_content("Bill Seacaster", count: 1)
      expect(page).to have_content("Misty Moore", count: 1)
      expect(page).to have_content("Uncle Carbuncle", count: 1)
      expect(page).to_not have_content("Brennan Lee Mulligan") # kid
      expect(page).to_not have_content("Aabria Iyengar") # kid
      expect(page).to_not have_content("Kingston Brown") # adult without this airline's flights
    end
  end

  describe "Extension, Frequent Flyers" do
    let!(:passenger1) { Passenger.create(name: "Brennan Lee Mulligan", age: 13) }
    let!(:passenger2) { Passenger.create(name: "Aabria Iyengar", age: 9) }
    let!(:passenger3) { Passenger.create(name: "Bill Seacaster", age: 46) }
    let!(:passenger4) { Passenger.create(name: "Misty Moore", age: 44) }
    let!(:passenger5) { Passenger.create(name: "Kingston Brown", age: 84) }

    let!(:passenger6) { Passenger.create(name: "Uncle Carbuncle", age: 99) }

    let!(:american) { Airline.create(name: "American") }
    let!(:delta) { Airline.create(name: "Delta") }
    let!(:jetblue) { Airline.create(name: "JetBlue") }
    let!(:southwest) { Airline.create(name: "Southwest") }
    let!(:united) { Airline.create(name: "United") }

    let!(:flight1) { Flight.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: american) }
    let!(:flight2) { Flight.create(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: delta) }
    let!(:flight3) { Flight.create(number: "9091", date:  "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: jetblue) }
    let!(:flight4) { Flight.create(number: "6798", date:  "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: southwest) }
    let!(:flight5) { Flight.create(number: "9665", date:  "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: united) }

    let!(:flight6) { Flight.create(number: "4242", date:  "11/13/2022", departure_city: "Los Angeles", arrival_city: "Denver", airline: american) }
    let!(:flight7) { Flight.create(number: "4224", date:  "11/13/2021", departure_city: "Denver", arrival_city: "Los Angeles", airline: american) }
    let!(:flight8) { Flight.create(number: "2442", date:  "11/13/2015", departure_city: "Xanadu", arrival_city: "Oz", airline: american) }

    let!(:flight_passenger1) { FlightPassenger.create(flight: flight1, passenger: passenger1) }
    let!(:flight_passenger2) { FlightPassenger.create(flight: flight2, passenger: passenger2) }
    let!(:flight_passenger3) { FlightPassenger.create(flight: flight3, passenger: passenger3) }
    let!(:flight_passenger4) { FlightPassenger.create(flight: flight4, passenger: passenger4) }
    let!(:flight_passenger5) { FlightPassenger.create(flight: flight5, passenger: passenger5) }
    let!(:flight_passenger6) { FlightPassenger.create(flight: flight1, passenger: passenger2) }
    let!(:flight_passenger7) { FlightPassenger.create(flight: flight2, passenger: passenger3) }
    let!(:flight_passenger8) { FlightPassenger.create(flight: flight3, passenger: passenger4) }
    let!(:flight_passenger9) { FlightPassenger.create(flight: flight4, passenger: passenger5) }
    let!(:flight_passenger10) { FlightPassenger.create(flight: flight5, passenger: passenger1) }
    let!(:flight_passenger11) { FlightPassenger.create(flight: flight1, passenger: passenger3) }
    let!(:flight_passenger12) { FlightPassenger.create(flight: flight2, passenger: passenger4) }
    let!(:flight_passenger13) { FlightPassenger.create(flight: flight3, passenger: passenger5) }
    let!(:flight_passenger14) { FlightPassenger.create(flight: flight4, passenger: passenger1) }
    let!(:flight_passenger15) { FlightPassenger.create(flight: flight5, passenger: passenger2) }
    let!(:flight_passenger16) { FlightPassenger.create(flight: flight1, passenger: passenger4) }
    let!(:flight_passenger17) { FlightPassenger.create(flight: flight2, passenger: passenger5) }
    let!(:flight_passenger18) { FlightPassenger.create(flight: flight3, passenger: passenger1) }
    let!(:flight_passenger19) { FlightPassenger.create(flight: flight4, passenger: passenger2) }
    let!(:flight_passenger20) { FlightPassenger.create(flight: flight5, passenger: passenger3) }

    let!(:flight_passenger21) { FlightPassenger.create(flight: flight6, passenger: passenger6) }
    let!(:flight_passenger22) { FlightPassenger.create(flight: flight6, passenger: passenger2) }
    let!(:flight_passenger23) { FlightPassenger.create(flight: flight6, passenger: passenger3) }
    let!(:flight_passenger24) { FlightPassenger.create(flight: flight7, passenger: passenger4) }
    let!(:flight_passenger25) { FlightPassenger.create(flight: flight8, passenger: passenger4) }
    # As a visitor
    # When I visit an airline's show page,
    # Then I see that the list of adult passengers is sorted
    # by the number of flights each passenger has taken on the airline from most to least
    # (Note: you should only make 1 database query to retrieve the sorted list of passengers)
    it "sorts the passengers by most to least flights with this airline" do
      visit "/airlines/#{american.id}"
      save_and_open_page

      expect("Misty Moore").to appear_before("Bill Seacaster")
      expect("Bill Seacaster").to appear_before("Uncle Carbuncle")
    end
  end
end
