require 'rails_helper'

RSpec.describe 'Arline show' do
  it 'shows a list of all unique adult passengers on airline flights' do
    airline1 = Airline.create!(name: 'Frontier')
    flight1 = airline1.flights.create!(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
    passenger1 = Passenger.create(name: 'Eric', age: 28)
    passenger2 = Passenger.create(name: 'Mike', age: 40)
    passenger3 = Passenger.create(name: 'Dani', age: 17)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger1.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger2.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger3.id)

    flight2 = airline1.flights.create!(number: '1234', date: '08/04/20', departure_city: 'Seattle', arrival_city: 'LA')

    FlightPassenger.create(flight_id: flight2.id, passenger_id: passenger1.id)

    visit "/airlines/#{airline1.id}"

    expect(page).to have_content('Eric')
    expect(page).to have_content('Mike')
    expect(page).to_not have_content('Dani')

  end
end
