require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it { should have_many :passenger_flights }
    it { should have_many(:flights).through(:passenger_flights) }
  end

  describe 'behaviors' do
    it 'can return the PassengerFlight association' do
      airline1 = Airline.create(name: 'Flight Matters')

      flight1 = airline1.flights.create(number: '423', date: 'June 8, 2022', departure_city: 'Denver',
                                        arrival_city: 'Sacramento')

      pass1 = Passenger.create(name: 'John Wisbrook', age: 45)
      pass2 = Passenger.create(name: 'Kate Wisbrook', age: 45)

      pf1 = PassengerFlight.create(passenger_id: pass1.id, flight_id: flight1.id)
      pf2 = PassengerFlight.create(passenger_id: pass2.id, flight_id: flight1.id)

      expect(pass1.flight_association).to eq(pf1.id)
    end
  end
end
