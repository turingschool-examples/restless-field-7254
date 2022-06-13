require 'rails_helper'

RSpec.describe 'Flight Index Page', type: :feature do 
  describe 'User Story 1' do 
    it 'has a list of all the flight numbers' do 
      frontier = Airline.create!(name: 'Frontier Airlines')
      delta = Airline.create!(name: 'Delta Airlines')

      flight = frontier.flights.create!(number: 1427, date: '06/17/22', departure_city: 'Denver', arrival_city: 'San Francisco')
      flight2 = frontier.flights.create!(number: 7230, date: '07/17/22', departure_city: 'Anchorage', arrival_city: 'Chicago')
      flight3 = delta.flights.create!(number: 6589, date: '08/19/22', departure_city: 'New Orleans', arrival_city: 'Pheonix')

      passenger = Passenger.create!(name: 'Wilda', age: 43)
      passenger2 = Passenger.create!(name: 'Hilda', age: 6)
      passenger3 = Passenger.create!(name: 'Milda', age: 92)
      passenger4 = Passenger.create!(name: 'Tilda', age: 31)
      passenger5 = Passenger.create!(name: 'Kilda', age: 27)
      passenger6 = Passenger.create!(name: 'Yilda', age: 102)

      flight_passenger = FlightPassenger.create!(passenger: passenger, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger2, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger3, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger4, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger5, flight: flight3)
      flight_passenger = FlightPassenger.create!(passenger: passenger6, flight: flight3)


      visit flights_path
      expect(page).to have_content("All Flights")

      within "#flight-#{flight.id}" do 
        expect(page).to have_content(flight.number)
        expect(page).to have_content(frontier.name)
        expect(page).to have_content(passenger.name)
        expect(page).to have_content(passenger2.name)
        expect(page).to_not have_content(passenger3.name)
        expect(page).to_not have_content(delta.name)
      end

      within "#flight-#{flight2.id}" do 
        expect(page).to have_content(flight2.number)
        expect(page).to have_content(frontier.name)
        expect(page).to have_content(passenger3.name)
        expect(page).to have_content(passenger4.name)
        expect(page).to_not have_content(passenger.name)
        expect(page).to_not have_content(delta.name)
      end
      
      within "#flight-#{flight3.id}" do 
        expect(page).to have_content(flight3.number)
        expect(page).to have_content(delta.name)
        expect(page).to have_content(passenger5.name)
        expect(page).to have_content(passenger6.name)
        expect(page).to_not have_content(passenger3.name)
        expect(page).to_not have_content(frontier.name)
      end
    end
  end

  describe 'User Story 2' do 
    it 'has a link to remove a passenger from a flight' do 
      frontier = Airline.create!(name: 'Frontier Airlines')
      delta = Airline.create!(name: 'Delta Airlines')

      flight = frontier.flights.create!(number: 1427, date: '06/17/22', departure_city: 'Denver', arrival_city: 'San Francisco')
      flight2 = frontier.flights.create!(number: 7230, date: '07/17/22', departure_city: 'Anchorage', arrival_city: 'Chicago')
      flight3 = delta.flights.create!(number: 6589, date: '08/19/22', departure_city: 'New Orleans', arrival_city: 'Pheonix')

      passenger = Passenger.create!(name: 'Wilda', age: 43)
      passenger2 = Passenger.create!(name: 'Hilda', age: 6)
      passenger3 = Passenger.create!(name: 'Milda', age: 92)
      passenger4 = Passenger.create!(name: 'Tilda', age: 31)
      passenger5 = Passenger.create!(name: 'Kilda', age: 27)
      passenger6 = Passenger.create!(name: 'Yilda', age: 102)

      flight_passenger = FlightPassenger.create!(passenger: passenger, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger2, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger3, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger4, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger5, flight: flight3)
      flight_passenger = FlightPassenger.create!(passenger: passenger6, flight: flight3)

      visit flights_path
      expect(page).to have_content('All Flights')

      within "#flight-#{flight.id}" do 
        expect(page).to have_content(passenger.name)
        expect(page).to have_content(passenger2.name)
        expect(page).to have_link("Remove #{passenger.name}")
        expect(page).to have_link("Remove #{passenger2.name}")
      end

      within "#flight-#{flight2.id}" do 
        expect(page).to have_content(passenger3.name)
        expect(page).to have_content(passenger4.name)
        expect(page).to have_link("Remove #{passenger3.name}")
        expect(page).to have_link("Remove #{passenger4.name}")
      end
      
      within "#flight-#{flight3.id}" do 
        expect(page).to have_content(passenger5.name)
        expect(page).to have_content(passenger6.name)
        expect(page).to have_link("Remove #{passenger5.name}")
        expect(page).to have_link("Remove #{passenger6.name}")
      end
    end

    it 'when clicked the passenger no longer appears on that flight' do 
      frontier = Airline.create!(name: 'Frontier Airlines')
      delta = Airline.create!(name: 'Delta Airlines')

      flight = frontier.flights.create!(number: 1427, date: '06/17/22', departure_city: 'Denver', arrival_city: 'San Francisco')
      flight2 = frontier.flights.create!(number: 7230, date: '07/17/22', departure_city: 'Anchorage', arrival_city: 'Chicago')
      flight3 = delta.flights.create!(number: 6589, date: '08/19/22', departure_city: 'New Orleans', arrival_city: 'Pheonix')

      passenger = Passenger.create!(name: 'Wilda', age: 43)
      passenger2 = Passenger.create!(name: 'Hilda', age: 6)
      passenger3 = Passenger.create!(name: 'Milda', age: 92)
      passenger4 = Passenger.create!(name: 'Tilda', age: 31)
      passenger5 = Passenger.create!(name: 'Kilda', age: 27)
      passenger6 = Passenger.create!(name: 'Yilda', age: 102)

      flight_passenger = FlightPassenger.create!(passenger: passenger, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger2, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger3, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger4, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger5, flight: flight3)
      flight_passenger = FlightPassenger.create!(passenger: passenger6, flight: flight3)

      visit flights_path
      within "#flight-#{flight3.id}" do 
        expect(page).to have_content(passenger5.name)
        expect(page).to have_content(passenger6.name)
        click_link("Remove #{passenger5.name}")
      end
      expect(current_path).to eq(flights_path)
      within "#flight-#{flight3.id}" do 
        expect(page).to have_content(passenger6.name)
        expect(page).to_not have_content(passenger5.name)
      end 
    end
  end
end