require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many :flights }
    it { should have_many :passengers, through: :flights }
  end
  describe 'behaviors' do
    it 'can return all adult passengers' do
      airline1 = Airline.create(name: 'Flight Matters')
      airline2 = Airline.create(name: 'Vulkan')

      flight1 = airline1.flights.create(number: '423', date: 'June 8, 2022', departure_city: 'Denver',
                                        arrival_city: 'Sacramento')
      flight2 = airline1.flights.create(number: '938', date: 'June 5, 2022', departure_city: 'Los Angeles',
                                        arrival_city: 'Watsontown')
      flight3 = airline1.flights.create(number: '248', date: 'June 4, 2022', departure_city: 'Williamsport',
                                        arrival_city: 'Turbotville')
      flight4 = airline2.flights.create(number: '098', date: 'June 3, 2022', departure_city: 'McEwensville',
                                        arrival_city: 'Harrisburg')
      flight5 = airline2.flights.create(number: '209', date: 'June 2, 2022', departure_city: 'San Diego',
                                        arrival_city: 'Kansnas City')
      flight6 = airline2.flights.create(number: '029', date: 'June 1, 2022', departure_city: 'York',
                                        arrival_city: 'Sierra Vista')

      pass1 = Passenger.create(name: 'John Wisbrook', age: 45)
      pass2 = Passenger.create(name: 'Kate Wisbrook', age: 45)
      pass3 = Passenger.create(name: 'Alex Spoop', age: 45)
      pass4 = Passenger.create(name: 'Caren Longsby', age: 45)
      pass5 = Passenger.create(name: 'Lake Pond', age: 45)
      pass6 = Passenger.create(name: 'Gloop Faliponi', age: 45)
      pass7 = Passenger.create(name: 'Spur Salmon', age: 45)
      pass8 = Passenger.create(name: 'Kelp Kenwood', age: 45)
      pass9 = Passenger.create(name: 'Jorge Jorgenson', age: 45)
      pass10 = Passenger.create(name: 'Loop Lensfield', age: 45)
      pass11 = Passenger.create(name: 'Tommy Twoshoes', age: 45)
      pass12 = Passenger.create(name: 'Little Guy', age: 45)

      PassengerFlight.create(passenger_id: pass1.id, flight_id: flight1.id)
      PassengerFlight.create(passenger_id: pass1.id, flight_id: flight3.id)
      PassengerFlight.create(passenger_id: pass2.id, flight_id: flight1.id)
      PassengerFlight.create(passenger_id: pass2.id, flight_id: flight2.id)
      PassengerFlight.create(passenger_id: pass3.id, flight_id: flight2.id)
      PassengerFlight.create(passenger_id: pass4.id, flight_id: flight3.id)
      PassengerFlight.create(passenger_id: pass5.id, flight_id: flight4.id)
      PassengerFlight.create(passenger_id: pass6.id, flight_id: flight4.id)
      PassengerFlight.create(passenger_id: pass7.id, flight_id: flight4.id)
      PassengerFlight.create(passenger_id: pass8.id, flight_id: flight5.id)
      PassengerFlight.create(passenger_id: pass9.id, flight_id: flight5.id)
      PassengerFlight.create(passenger_id: pass10.id, flight_id: flight1.id)
      PassengerFlight.create(passenger_id: pass11.id, flight_id: flight2.id)
      PassengerFlight.create(passenger_id: pass12.id, flight_id: flight3.id)

      expect(airline1.adult_passengers).to match_array(['John Wisbrook', 'Kate Wisbrook', 'Alex Spoop',
                                                        'Caren Longsby'])
    end
  end
end

