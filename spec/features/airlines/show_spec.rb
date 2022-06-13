require 'rails_helper'

RSpec.describe Airline, type: :feature do
  describe 'the index page' do

    it 'tests user story 3' do
      # As a visitor
      # When I visit an airline's show page
      # Then I see a list of passengers that have flights on that airline
      # And I see that this list is unique (no duplicate passengers)
      # And I see that this list only includes adult passengers
      #
      # (Note: an adult is anyone with age greater than or equal to 18)


      airline_1 = Airline.create!(name: "Amercian")
      flight_1 = airline_1.flights.create!(number: 7990, date: 2/7/2022, departure_city: "Glendale", arrival_city: "Dallas")
      flight_2 = airline_1.flights.create!(number: 3940, date: 3/10/2022, departure_city: "Detroit", arrival_city: "Orlando")
      flight_3 = airline_1.flights.create!(number: 9091, date: 5/17/2022, departure_city: "Chicago", arrival_city: "Kansas City")
      flight_4 = airline_1.flights.create!(number: 6798, date: 10/9/2022, departure_city: "Tulsa", arrival_city: "Fresno")

      passenger_1 = Passenger.create!(name:"Brennan", age: 40)
      passenger_2 = Passenger.create!(name:"Aabria", age: 24)
      passenger_3 = Passenger.create!(name:"Bill", age: 15)
      passenger_4 = Passenger.create!(name:"Misty", age: 12)
      passenger_5 = Passenger.create!(name:"Kingston", age: 29)

      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_2.id)
      PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_3.id)
      PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_4.id)
      PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_4.id)


      visit "/airlines/#{airline_1.id}"
      # save_and_open_page

      expect(page).to have_content(passenger_1.name, count:1)
      expect(page).to have_content(passenger_2.name, count:1)
      expect(page).to have_content(passenger_5.name, count:1)
      expect(page).to_not have_content(passenger_3.name, count:1)
      expect(page).to_not have_content(passenger_4.name, count:1)


    end

    it 'tests the extension' do
      airline_1 = Airline.create!(name: "Amercian")
      flight_1 = airline_1.flights.create!(number: 7990, date: 2/7/2022, departure_city: "Glendale", arrival_city: "Dallas")
      flight_2 = airline_1.flights.create!(number: 3940, date: 3/10/2022, departure_city: "Detroit", arrival_city: "Orlando")
      flight_3 = airline_1.flights.create!(number: 9091, date: 5/17/2022, departure_city: "Chicago", arrival_city: "Kansas City")
      flight_4 = airline_1.flights.create!(number: 6798, date: 10/9/2022, departure_city: "Tulsa", arrival_city: "Fresno")

      passenger_1 = Passenger.create!(name:"Brennan", age: 40)
      passenger_2 = Passenger.create!(name:"Aabria", age: 24)
      passenger_3 = Passenger.create!(name:"Bill", age: 15)
      passenger_4 = Passenger.create!(name:"Misty", age: 12)
      passenger_5 = Passenger.create!(name:"Kingston", age: 29)

      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_1.id, flight_id: flight_2.id)
      PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight_3.id)
      PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_4.id)
      PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_1.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_2.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_3.id)
      PassengerFlight.create!(passenger_id: passenger_5.id, flight_id: flight_4.id)


      visit "/airlines/#{airline_1.id}"

      expect(passenger_5.name).to appear_before(passenger_1.name)
      expect(passenger_1.name).to appear_before(passenger_2.name)
      # save_and_open_page

    end

  end
end
