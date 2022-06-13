require 'rails_helper'

RSpec.describe "Flights Index View", type: :feature do
  describe "User Story 1, Flights Index Page" do
    let!(:passenger1) { Passenger.create(name: "Brennan Lee Mulligan", age: 13) }
    let!(:passenger2) { Passenger.create(name: "Aabria Iyengar", age: 9) }
    let!(:passenger3) { Passenger.create(name: "Bill Seacaster", age: 46) }
    let!(:passenger4) { Passenger.create(name: "Misty Moore", age: 44) }
    let!(:passenger5) { Passenger.create(name: "Kingston Brown", age: 84) }

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
    # As a visitor
    # When I visit the flights index page
    # I see a list of all flight numbers
    # And next to each flight number I see the name of the Airline of that flight
    # And under each flight number I see the names of all that flight's passengers
    it "shows all the flight numbers, their airlines, and passenger names" do
      visit "/flights"

      within "#flight-#{flight1.id}" do
        expect(page).to have_content(flight1.number)
        expect(page).to have_content(american.name)
        expect(page).to have_content(passenger1.name)
        expect(page).to have_content(passenger2.name)
        expect(page).to have_content(passenger3.name)
        expect(page).to have_content(passenger4.name)
        expect(page).to_not have_content(passenger5.name)
      end

      within "#flight-#{flight2.id}" do
        expect(page).to have_content(flight2.number)
        expect(page).to have_content(delta.name)
        expect(page).to have_content(passenger2.name)
        expect(page).to have_content(passenger3.name)
        expect(page).to have_content(passenger4.name)
        expect(page).to have_content(passenger5.name)
        expect(page).to_not have_content(passenger1.name)
      end

      within "#flight-#{flight3.id}" do
        expect(page).to have_content(flight3.number)
        expect(page).to have_content(jetblue.name)
        expect(page).to have_content(passenger3.name)
        expect(page).to have_content(passenger4.name)
        expect(page).to have_content(passenger5.name)
        expect(page).to have_content(passenger1.name)
        expect(page).to_not have_content(passenger2.name)
      end

      within "#flight-#{flight4.id}" do
        expect(page).to have_content(flight4.number)
        expect(page).to have_content(southwest.name)
        expect(page).to have_content(passenger4.name)
        expect(page).to have_content(passenger5.name)
        expect(page).to have_content(passenger1.name)
        expect(page).to have_content(passenger2.name)
        expect(page).to_not have_content(passenger3.name)
      end

      within "#flight-#{flight5.id}" do
        expect(page).to have_content(flight5.number)
        expect(page).to have_content(united.name)
        expect(page).to have_content(passenger5.name)
        expect(page).to have_content(passenger1.name)
        expect(page).to have_content(passenger2.name)
        expect(page).to have_content(passenger3.name)
        expect(page).to_not have_content(passenger4.name)
      end
    end
  end

  describe "User Story 2, Remove a Passenger from a Flight" do
    let!(:passenger1) { Passenger.create(name: "Brennan Lee Mulligan", age: 13) }
    let!(:passenger2) { Passenger.create(name: "Aabria Iyengar", age: 9) }
    let!(:passenger3) { Passenger.create(name: "Bill Seacaster", age: 46) }
    let!(:passenger4) { Passenger.create(name: "Misty Moore", age: 44) }
    let!(:passenger5) { Passenger.create(name: "Kingston Brown", age: 84) }

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
    # As a visitor
    # When I visit the flights index page
    # Next to each passengers name
    # I see a link or button to remove that passenger from that flight
    # When I click on that link/button
    # I'm returned to the flights index page
    # And I no longer see that passenger listed under that flight
    # (Note: you should not destroy the passenger record entirely)
    it "can remove a passenger from a specific flight" do
      visit "/flights"
      # save_and_open_page

      expect(page).to have_content("Remove Passenger", count: 20)

      within "#flight-#{flight1.id}" do
        expect(page).to have_content(passenger2.name)
      end

      within "#flight-#{flight2.id}" do
        expect(page).to have_content(passenger2.name)
        click_link("Remove Passenger ##{passenger2.id}")
      end

      expect(current_path).to eq("/flights")

      within "#flight-#{flight1.id}" do
        expect(page).to have_content(passenger2.name)
      end

      within "#flight-#{flight2.id}" do
        expect(page).to_not have_content(passenger2.name)
      end
    end
  end
end
