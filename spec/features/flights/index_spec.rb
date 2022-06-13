require 'rails_helper'

RSpec.describe 'flights#index' do
  before :each do
    @a1 = Airline.create!(name: 'airline1')
    @f1 = Flight.create!(number: '1', date: '1/1/11', departure_city: 'Pensacola', arrival_city: 'Norfolk',
                         airline_id: @a1.id)
    @p1 = Passenger.create!(name: 'Bryce', age: 29)
    @p2 = Passenger.create!(name: 'Stephanie', age: 31)
    @fp1 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p1.id)
    @fp2 = FlightPassenger.create!(flight_id: @f1.id, passenger_id: @p2.id)

    @a2 = Airline.create!(name: 'airline2')
    @f2 = Flight.create!(number: '2', date: '1/1/12', departure_city: 'Mobile', arrival_city: 'Bend',
                         airline_id: @a2.id)
    @p3 = Passenger.create!(name: 'Frank', age: 30)
    @p4 = Passenger.create!(name: 'Bob', age: 15)
    @fp3 = FlightPassenger.create!(flight_id: @f2.id, passenger_id: @p3.id)
    @fp4 = FlightPassenger.create!(flight_id: @f2.id, passenger_id: @p4.id)
  end

  it 'should list all flight numbers/airlines/passengers' do
    visit flights_path

    within "#flight-#{@f1.id}" do
      expect(page).to have_content(@f1.number)
      expect(page).to have_content(@a1.name)
      expect(page).to have_content(@p1.name)
      expect(page).to have_content(@p2.name)
    end
    within "#flight-#{@f2.id}" do
      expect(page).to have_content(@f2.number)
      expect(page).to have_content(@a2.name)
      expect(page).to have_content(@p3.name)
      expect(page).to have_content(@p4.name)
    end
  end

  it 'should have a link to remove passenger from a flight' do
    visit flights_path

    within "#flight-#{@f1.id}" do
      expect(page).to have_content(@p1.name)
      expect(page).to have_content(@p2.name)

      within "#passenger-#{@p1.id}" do
        click_on 'Remove'
      end
    end

    expect(current_path).to eq(flights_path)

    within "#flight-#{@f1.id}" do
      expect(page).to_not have_content(@p1.name)
      expect(page).to have_content(@p2.name)
    end
  end
end
