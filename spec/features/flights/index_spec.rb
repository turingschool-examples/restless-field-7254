require 'rails_helper'

RSpec.describe Flight, type: :feature do
  describe 'the index page' do

    it 'tests user story 1' do
      # As a visitor
      # When I visit the flights index page
      # I see a list of all flight numbers
      # And next to each flight number I see the name of the Airline of that flight
      # And under each flight number I see the names of all that flight's passengers
      airline_1 = Airline.create!(name: "Amercian")
      airline_2 = Airline.create!(name: "Delta")
      flight_1 = airline_1.flights.create!(number: 7990, date: 2/7/2022, departure_city: "Glendale", arrival_city: "Dallas")
      flight_2 = airline_1.flights.create!(number: 3940, date: 3/10/2022, departure_city: "Detroit", arrival_city: "Orlando")
      flight_3 = airline_2.flights.create!(number: 9091, date: 5/17/2022, departure_city: "Chicago", arrival_city: "Kansas City")
      flight_4 = airline_2.flights.create!(number: 6798, date: 10/9/2022, departure_city: "Tulsa", arrival_city: "Fresno")

      passenger_1 = Passenger.create!(name:"Brennan")
      passenger_2 = Passenger.create!(name:"Aabria")
      passenger_3 = Passenger.create!(name:"Bill")
      passenger_4 = Passenger.create!(name:"Misty")
      passenger_5 = Passenger.create!(name:"Kingston")

      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_2.id)
      PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_3.id)
      PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_4.id)
      PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_4.id)


      visit "/flights"

      within "#flight-#{flight_1.id}" do
        expect(page).to have_content(flight_1.number)
        expect(page).to have_content(flight_1.airline.name)
        expect(page).to have_content(passenger_1.name)
        expect(page).to have_content(passenger_4.name)
        expect(page).to_not have_content(flight_2.number)
        expect(page).to_not have_content(flight_3.number)
        expect(page).to_not have_content(flight_4.number)
      end

      within "#flight-#{flight_2.id}" do
        expect(page).to have_content(flight_2.number)
        expect(page).to have_content(flight_2.airline.name)
        expect(page).to have_content(passenger_1.name)
        expect(page).to_not have_content(flight_1.number)
        expect(page).to_not have_content(flight_3.number)
        expect(page).to_not have_content(flight_4.number)
      end

      within "#flight-#{flight_3.id}" do
        expect(page).to have_content(flight_3.number)
        expect(page).to have_content(flight_3.airline.name)
        expect(page).to have_content(passenger_2.name)
        expect(page).to_not have_content(flight_2.number)
        expect(page).to_not have_content(flight_1.number)
        expect(page).to_not have_content(flight_4.number)
      end

      within "#flight-#{flight_4.id}" do
        expect(page).to have_content(flight_4.number)
        expect(page).to have_content(flight_4.airline.name)
        expect(page).to have_content(passenger_3.name)
        expect(page).to have_content(passenger_5.name)
        expect(page).to_not have_content(flight_1.number)
        expect(page).to_not have_content(flight_2.number)
        expect(page).to_not have_content(flight_3.number)
      end

    end

    it 'tests user story 2' do
      airline_1 = Airline.create!(name: "Amercian")
      airline_2 = Airline.create!(name: "Delta")
      flight_1 = airline_1.flights.create!(number: 7990, date: 2/7/2022, departure_city: "Glendale", arrival_city: "Dallas")
      flight_2 = airline_1.flights.create!(number: 3940, date: 3/10/2022, departure_city: "Detroit", arrival_city: "Orlando")
      flight_3 = airline_2.flights.create!(number: 9091, date: 5/17/2022, departure_city: "Chicago", arrival_city: "Kansas City")
      flight_4 = airline_2.flights.create!(number: 6798, date: 10/9/2022, departure_city: "Tulsa", arrival_city: "Fresno")

      passenger_1 = Passenger.create!(name:"Brennan")
      passenger_2 = Passenger.create!(name:"Aabria")
      passenger_3 = Passenger.create!(name:"Bill")
      passenger_4 = Passenger.create!(name:"Misty")
      passenger_5 = Passenger.create!(name:"Kingston")

      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_2.id)
      PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_3.id)
      PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_4.id)
      PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_4.id)


      # As a visitor
      # When I visit the flights index page
      # Next to each passengers name
      # I see a link or button to remove that passenger from that flight
      # When I click on that link/button
      # I'm returned to the flights index page
      # And I no longer see that passenger listed under that flight
      #
      # (Note: you should not destroy the passenger record entirely)
      # binding.pry
      visit "/flights"

      # save_and_open_page

      within "#flight-#{flight_1.id}" do
        expect(page).to have_link("Remove #{passenger_1.name} from this flight")
        expect(page).to have_link("Remove #{passenger_4.name} from this flight")
      end

      within "#flight-#{flight_2.id}" do
        expect(page).to have_link("Remove #{passenger_1.name} from this flight")
      end

      within "#flight-#{flight_3.id}" do
        expect(page).to have_link("Remove #{passenger_2.name} from this flight")
      end

      within "#flight-#{flight_4.id}" do
        expect(page).to have_link("Remove #{passenger_3.name} from this flight")
        expect(page).to have_link("Remove #{passenger_5.name} from this flight")
      end

      within "#flight-#{flight_1.id}" do
        click_link("Remove #{passenger_1.name} from this flight")
      end

      expect(current_path).to eq("/flights")

      within "#flight-#{flight_1.id}" do
        expect(page).to_not have_link("Remove #{passenger_1.name} from this flight")
        expect(page).to have_link("Remove #{passenger_4.name} from this flight")
      end

      #this will test to make sure the passenger record was not deleted entirely

      within "#flight-#{flight_2.id}" do
        expect(page).to have_link("Remove #{passenger_1.name} from this flight")
      end

    end

  end
end
