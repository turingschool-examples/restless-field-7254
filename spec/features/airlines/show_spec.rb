require 'rails_helper'

RSpec.describe Airlines: :Show do
  before :each do
    @airline = Airline.create!(name: 'Frontier')
    @flight1 = Flight.create!(number: '1727', date: '08/03/20', departure_city: 'Denver',
                              arrival_city: 'Reno', airline_id: @airline.id)
    @flight2 = Flight.create!(number: '1828', date: '08/04/20', departure_city: 'Peoria',
                              arrival_city: 'Madison', airline_id: @airline.id)
    @flight3 = Flight.create!(number: '1929', date: '08/01/20', departure_city: 'Dallas',
                              arrival_city: 'Detroit', airline_id: @airline.id)
    @passenger1 = Passenger.create!(name: 'Joe', age: 20)
    @passenger2 = Passenger.create!(name: 'Mike', age: 25)
    @passenger3 = Passenger.create!(name: 'Dani', age: 16)
    @passenger4 = Passenger.create!(name: 'Richard', age: 30)
    @pf1 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @pf2 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @pf3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @pf4 = PassengerFlight.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
    @pf5 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight2.id)
    @pf6 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight3.id)
    @pf7 = PassengerFlight.create!(passenger_id: @passenger4.id, flight_id: @flight3.id)
  end


  it 'shows a unique list of adult passengers that have flights on the airline' do
    visit airline_path(@airline)

    within '#passengers' do
    expect(page).to have_content(@passenger1.name, count: 1)
    expect(page).to have_content(@passenger2.name, count: 1)
    expect(page).to have_content(@passenger4.name, count: 1)
    expect(page).to_not have_content(@passenger3.name)
    end
  end

  it 'shows a unique list of adult passengers that have flights on the airline ordered by number of flights' do
    visit airline_path(@airline)

    within '#passengers' do
    expect(page).to have_content(@passenger1.name, count: 1)
    expect(page).to have_content(@passenger2.name, count: 1)
    expect(page).to have_content(@passenger4.name, count: 1)
    expect(page).to_not have_content(@passenger3.name)

    expect(@passenger1.name).to appear_before(@passenger2.name)
    expect(@passenger1.name).to appear_before(@passenger4.name)
    expect(@passenger4.name).to appear_before(@passenger2.name)
    end
  end
end
