require 'rails_helper'
# save_and_open_page

RSpec.describe 'Flights index page', type: :model do

  before(:each) do
    @united = Airline.create!(name: "Wind United")
    @spirit = Airline.create!(name: "Spirit of Freedom")
    @flight1 = @united.flights.create!(number: 879, date: Date.today, departure_city: "Miami", arrival_city: "Portland")
    @flight2 = @united.flights.create!(number: 564, date: Date.today, departure_city: "Fort Myers", arrival_city: "Syracuse")
    @flight3 = @united.flights.create!(number: 231, date: Date.today, departure_city: "Port Charlotte", arrival_city: "Boston")
    @flight4 = @spirit.flights.create!(number: 693, date: Date.today, departure_city: "Tampa", arrival_city: "Denver")

    @passenger1 = Passenger.create!(name: "Jimbob", age: 18)
    @passenger2 = Passenger.create!(name: "Sally", age: 19)
    @passenger3 = Passenger.create!(name: "Pepsi", age: 5)
    @passenger4 = Passenger.create!(name: "Parker", age: 90)
    @passenger5 = Passenger.create!(name: "Deannah", age: 29)
    @passenger6 = Passenger.create!(name: "Casey", age: 25)

    @passenger1.passenger_flights.create!(flight_id: @flight1)
    @passenger2.passenger_flights.create!(flight_id: @flight2)
    @passenger3.passenger_flights.create!(flight_id: @flight3)
    @passenger4.passenger_flights.create!(flight_id: @flight1)
    @passenger5.passenger_flights.create!(flight_id: @flight2)
    @passenger6.passenger_flights.create!(flight_id: @flight3)

    @passenger4.passenger_flights.create!(flight_id: @flight4)
    @passenger5.passenger_flights.create!(flight_id: @flight4)
    @passenger6.passenger_flights.create!(flight_id: @flight4)
  end

  it 'has a list of all flight numbers' do
    visit "/flights"
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@flight4.number)
  end

  it 'has the airline listed beside the flight number' do
    visit "/flights"
    expect(page).to have_content(@spirit.name)
    expect(page).to have_content(@united.name)
    expect(page).to have_content("693- Spirit of Freedom")
    expect(page).to have_content("879- Wind United")
  end

  it 'has passenger names listed under the flight number' do
    visit "/flights"

    within "#flight#{@flight4}Details" do
      expect(page).to have_content("Parker")
      expect(page).to have_content("Deannah")
      expect(page).to have_content("Casey")
    end
  end
end
