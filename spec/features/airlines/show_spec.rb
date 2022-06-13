require 'rails_helper'

RSpec.describe 'airlines#show', type: :feature do
  before :each do
    @a1 = Airline.create!(name: 'airline1')

    @f1 = Flight.create!(number: '1', date: '1/1/11', departure_city: 'Pensacola', arrival_city: 'Norfolk',
                         airline_id: @a1.id)
    @f2 = Flight.create!(number: '2', date: '1/1/12', departure_city: 'Tampa', arrival_city: 'Bend',
                         airline_id: @a1.id)
    @f3 = Flight.create!(number: '3', date: '1/1/13', departure_city: 'Mobile', arrival_city: 'New York',
                         airline_id: @a1.id)

    @p1 = Passenger.create!(name: 'Bryce', age: 29)
    @p2 = Passenger.create!(name: 'Stephanie', age: 18)
    @p3 = Passenger.create!(name: 'Clam', age: 60)
    @p4 = Passenger.create!(name: 'Tiff', age: 5)

    @fp1 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p1.id)
    @fp2 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p2.id)
    @fp3 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p3.id)
    @fp4 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p4.id)

    @fp4 = FlightPassenger.create!(flight_id: @f2.id, passenger_id: @p1.id)
    @fp5 = FlightPassenger.create!(flight_id: @f2.id, passenger_id: @p2.id)

    @fp6 = FlightPassenger.create!(flight_id: @f3.id, passenger_id: @p1.id)

    visit airline_path(@a1)
  end

  it 'should show passengers over age of 18' do
    within '#passengers' do
      expect(page).to have_content(@p1.name)
      expect(page).to have_content(@p2.name)
      expect(page).to have_content(@p3.name)
      expect(page).to_not have_content(@p4.name)
    end
  end

  it 'should show the passengers in order of flying frequency ' do
    within '#passengers' do
      expect(@p1.name).to appear_before(@p2.name)
      expect(@p2.name).to appear_before(@p3.name)
    end
  end
end
