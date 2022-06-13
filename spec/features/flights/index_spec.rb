require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  it 'lists flights' do
    airline1 = Airline.create(name: 'Sorth Weast Airlines')
    airline2 = Airline.create(name: 'Lambda Airlines')

    flight1 = airline1.flights.create(number: '9372', date: '01/01/22', departure_city: 'Denver',
                                      arrival_city: 'London')
    flight2 = airline1.flights.create(number: '8612', date: '02/02/22', departure_city: 'Denver',
                                      arrival_city: 'Madrid')
    flight3 = airline2.flights.create(number: '1739', date: '03/03/22', departure_city: 'Denver',
                                      arrival_city: 'Paris')

    passenger1 = Passenger.create(name: 'Stella', age: 31)
    passenger2 = Passenger.create(name: 'Astra', age: 16)
    passenger3 = Passenger.create(name: 'Casseopia', age: 42)
    passenger4 = Passenger.create(name: 'Andromeda', age: 27)

    FlightPassenger.create(flight: flight1, passenger: passenger1)
    FlightPassenger.create(flight: flight1, passenger: passenger2)
    FlightPassenger.create(flight: flight2, passenger: passenger3)
    FlightPassenger.create(flight: flight3, passenger: passenger4)

    visit '/flights'

    within '#index-0' do
      expect(page).to have_content('9372')
      expect(page).to_not have_content('8612')
      expect(page).to have_content('Sorth Weast Airlines')
      expect(page).to_not have_content('Lambda Airlines')
      expect(page).to have_content('Stella')
      expect(page).to have_content('Astra')
      expect(page).to_not have_content('Casseopia')
    end

    within '#index-1' do
      expect(page).to have_content('8612')
      expect(page).to_not have_content('1739')
      expect(page).to have_content('Sorth Weast Airlines')
      expect(page).to_not have_content('Lambda Airlines')
      expect(page).to have_content('Casseopia')
      expect(page).to_not have_content('Stella')
    end

    within '#index-2' do
      expect(page).to have_content('1739')
      expect(page).to_not have_content('9372')
      expect(page).to have_content('Lambda Airlines')
      expect(page).to_not have_content('Sorth Weast Airlines')
      expect(page).to have_content('Andromeda')
      expect(page).to_not have_content('Stella')
    end
  end

  it 'has button to remove passenger' do
    airline1 = Airline.create(name: 'Sorth Weast Airlines')
    airline2 = Airline.create(name: 'Lambda Airlines')

    flight1 = airline1.flights.create(number: '9372', date: '01/01/22', departure_city: 'Denver',
                                      arrival_city: 'London')
    flight2 = airline1.flights.create(number: '8612', date: '02/02/22', departure_city: 'Denver',
                                      arrival_city: 'Madrid')
    flight3 = airline2.flights.create(number: '1739', date: '03/03/22', departure_city: 'Denver',
                                      arrival_city: 'Paris')

    passenger1 = Passenger.create(name: 'Stella', age: 31)
    passenger2 = Passenger.create(name: 'Astra', age: 16)
    passenger3 = Passenger.create(name: 'Casseopia', age: 42)
    passenger4 = Passenger.create(name: 'Andromeda', age: 27)

    FlightPassenger.create(flight: flight1, passenger: passenger1)
    FlightPassenger.create(flight: flight1, passenger: passenger2)
    FlightPassenger.create(flight: flight2, passenger: passenger3)
    FlightPassenger.create(flight: flight3, passenger: passenger4)

    visit '/flights'

    within '#index-0' do
      expect(page).to have_content('Stella')
      expect(page).to have_content('Astra')
      click_button 'Remove Passenger'
      expect(page).to_not have_content('Stella')
    end

    within '#index-1' do
      expect(page).to have_content('Casseopia')
      click_button 'Remove Passenger'
      expect(page).to_not have_content('Casseopia')
    end

    within '#index-2' do
      expect(page).to have_content('Andromeda')
      click_button 'Remove Passenger'
      expect(page).to_not have_content('Andromeda')
    end
  end
end
