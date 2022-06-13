require 'rails_helper'

RSpec.describe Passenger, type: :model do
  let!(:airline_1) { Airline.create(name: "Fly Home") }
  let!(:flight_1) { airline_1.flights.create(number: 1, date: '6/21/22', departure_city: "Denver", arrival_city: "Idaho Falls") }
  let!(:flight_2) { airline_1.flights.create(number: 2, date: '6/29/22', departure_city: "Idaho Falls", arrival_city: "Denver") }
  let!(:passenger_1) { flight_1.passengers.create(name: "Hank" , age: 30 ) }
  let!(:passenger_2) { flight_1.passengers.create(name: "Sam", age: 40 ) }
  let!(:passenger_3) { flight_2.passengers.create(name: "Tom", age: 15 ) }
  let!(:passenger_4) { flight_2.passengers.create(name: "Don", age: 20 ) }
  
  let!(:passenger_5) { flight_1.passengers.create(name: "Don", age: 20 ) }

  it { should have_many(:flight_passengers) } 
  it { should have_many(:flights).through(:flight_passengers) }  
  it { should have_many(:airlines).through(:flights) }  

  it 'can return true or false if passenger is adult' do 
    expect(passenger_1.adult?).to eq(true)
    expect(passenger_3.adult?).to eq(false)
  end

  it 'can return only adults' do 
    expect(Passenger.adults_only).to eq([passenger_1, passenger_2, passenger_4, passenger_5])
  end

  # NOTE: this test is occationaly returning the passagers in a different order 
  it 'can return list of only unique passengers' do 
    expect(Passenger.unique_passengers).to eq(["Don","Hank", "Sam", "Tom"])
    # expect(Passenger.unique_passengers).to eq(["Don","Hank","Tom", "Sam"])
    # expect(Passenger.unique_passengers).to eq([passenger_1, passenger_2, passenger_3, pasenger_4])
  end
end
