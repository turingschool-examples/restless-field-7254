require 'rails_helper'

RSpec.describe Flights: :Index do
  before :each do
    @airline = Airline.create!(name: 'Frontier')
    @flight1 = Flight.create!(number: '1727', date: '08/03/20', departure_city: 'Denver',
                              arrival_city: 'Reno')
    @flight2 = Flight.create!(number: '1828', date: '08/04/20', departure_city: 'Peoria',
                              arrival_city: 'Madison')
    @flight3 = Flight.create!(number: '1929', date: '08/01/20', departure_city: 'Dallas',
                              arrival_city: 'Detroit')
    @passenger1 = Passenger.create!(name: 'Joe', age: 20)
    @passenger2 = Passenger.create!(name: 'Mike', age: 25)
    @passenger3 = Passenger.create!(name: 'Dani', age: 24)
    @passenger4 = Passenger.create!(name: 'Richard', age: 30)
    @pf1 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @pf2 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @pf3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @pf3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
  end

  it 'shows a list of all flights' do
    vitsit flight_index_path

  end
end
