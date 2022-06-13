require 'rails_helper'

RSpec.describe 'airlines#show', type: :feature do
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

  it 'should show passengers over age of 18' do
    visit airline_path(@a1)

    within '#passengers' do
      expect(page).to have_content(@p1.name)
      expect(page).to_not have_content(@p2.name)
      expect(page).to_not have_content(@p5.name)
    end
  end
end
