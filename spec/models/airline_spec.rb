require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it {should have_many(:passengers).through(:flights)}

  describe 'methods' do
    it 'gives me the unique adult passengers' do
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

      expect(airline_1.adult_passengers).to eq([passenger_1, passenger_2, passenger_5])

    end
  end
end
