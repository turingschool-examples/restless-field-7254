require 'rails_helper'

RSpec.describe Airline, type: :model do
  let!(:airline_1) { Airline.create!(name: "Fly Away") }
  # let!(:airline_2) { Airline.create!(name: "Fly Home") }

  let!(:flight_1) { airline_1.flights.create!(number: 1, date: '6/21/22', departure_city: "Denver", arrival_city: "Idaho Falls") }
  let!(:flight_2) { airline_1.flights.create!(number: 2, date: '6/29/22', departure_city: "Idaho Falls", arrival_city: "Denver") }
  let!(:flight_3) { airline_1.flights.create!(number: 2, date: '7/01/22', departure_city: "Denver", arrival_city: "Las Vegas") }

  let!(:passenger_1) { Passenger.create!(name: "Hank" , age: 30 ) }
  let!(:passenger_2) { Passenger.create!(name: "Sam", age: 40 ) }
  let!(:passenger_3) { Passenger.create!(name: "Tom", age: 15 ) }
  let!(:passenger_4) { Passenger.create!(name: "Don", age: 20 ) }

  # let!(:fp_1) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger_1.id)}
  # let!(:fp_2) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger_2.id)}
  # let!(:fp_3) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_3.id)}
  # let!(:fp_4) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_4.id)}
  # let!(:fp_5) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_1.id)}

  let!(:fp_1) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger_1.id)}
  let!(:fp_2) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_1.id)}
  let!(:fp_3) { FlightPassenger.create!(flight_id: flight_3.id, passenger_id: passenger_1.id)}
  let!(:fp_4) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger_2.id)}
  let!(:fp_5) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_2.id)}

  let!(:fp_6) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_3.id)}
  let!(:fp_7) { FlightPassenger.create!(flight_id: flight_3.id, passenger_id: passenger_3.id)}

  let!(:fp_8) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_4.id)}


  it { should have_many(:flights) }
  it { should have_many(:flight_passengers).through(:flights) } 
  it { should have_many(:passengers).through(:flight_passengers) } 

  it 'can return list of unique adult passengers' do 
    expected = ["Hank", "Sam", "Don"]
    expected = [passenger_1, passenger_2, passenger_4]

    expect(airline_1.unique_adult_passengers.each do |passenger| passenger.name end ).to eq(expected)
  end

end