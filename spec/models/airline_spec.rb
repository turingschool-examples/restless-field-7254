require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe 'instance methods' do
    before :each do
      @a1 = Airline.create!(name: 'airline1')
      @f1 = Flight.create!(number: '1', date: '1/1/11', departure_city: 'Pensacola', arrival_city: 'Norfolk',
                           airline_id: @a1.id)
      @p1 = Passenger.create!(name: 'Bryce', age: 29)
      @p2 = Passenger.create!(name: 'Stephanie', age: 17)
      @p5 = Passenger.create!(name: 'Clam', age: 14)
      @fp1 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p1.id)
      @fp2 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p2.id)
      @fp5 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p5.id)
    end

    it '#adult_passengers' do
      expect(@a1.adult_passengers.length).to eq(1)
      expect(@a1.adult_passengers.first.name).to eq('Bryce')
    end
  end
end
