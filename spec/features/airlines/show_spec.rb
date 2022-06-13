require 'rails_helper'

RSpec.describe 'Airline Show Page', type: :feature do 
  describe 'User Story 3' do 
    it 'has a list of passengers that have flights with this airline' do 
      southwest = Airline.create!(name: 'Southwest')
      spirit = Airline.create!(name: 'Spirit Airlines')

      flight = southwest.flights.create!(number: 1427, date: '06/17/22', departure_city: 'Denver', arrival_city: 'San Francisco')
      flight2 = southwest.flights.create!(number: 7230, date: '07/17/22', departure_city: 'Anchorage', arrival_city: 'Chicago')
      flight3 = southwest.flights.create!(number: 6589, date: '08/19/22', departure_city: 'New Orleans', arrival_city: 'Pheonix') 
      flight4 = spirit.flights.create!(number: 666, date: '09/22/22', departure_city: 'Omaha', arrival_city: 'Purgatory')

      passenger = Passenger.create!(name: 'Wilda', age: 43)
      passenger2 = Passenger.create!(name: 'Hilda', age: 6)
      passenger3 = Passenger.create!(name: 'Milda', age: 17)
      passenger4 = Passenger.create!(name: 'Tilda', age: 31)
      passenger5 = Passenger.create!(name: 'Kilda', age: 66)
      passenger6 = Passenger.create!(name: 'Yilda', age: 45)
      passenger7 = Passenger.create!(name: 'Greg', age: 102)

      flight_passenger = FlightPassenger.create!(passenger: passenger, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger2, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger, flight: flight3)
      flight_passenger = FlightPassenger.create!(passenger: passenger6, flight: flight)
      flight_passenger = FlightPassenger.create!(passenger: passenger5, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger3, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger4, flight: flight2)
      flight_passenger = FlightPassenger.create!(passenger: passenger5, flight: flight3)
      flight_passenger = FlightPassenger.create!(passenger: passenger6, flight: flight3)
      flight_passenger = FlightPassenger.create!(passenger: passenger7, flight: flight4)

      visit airline_path(southwest.id)
      expect(page).to have_content(southwest.name)
      expect(page).to have_content(passenger.name, count: 1)
      expect(page).to have_content(passenger4.name, count: 1)
      expect(page).to have_content(passenger5.name, count: 1)
      expect(page).to have_content(passenger6.name, count: 1)
      expect(page).to_not have_content(passenger7.name)
      expect(page).to_not have_content(spirit.name)
    end
  end
end