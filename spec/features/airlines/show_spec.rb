require 'rails_helper'

RSpec.describe 'airline show page' do
  before(:each) do
    @airline1 = Airline.create!(name: "American")
    @airline2 = Airline.create!(name: "Delta")
    # @airline3 = Airline.create!(Name: "JetBlue")
    # @airline4 = Airline.create!(Name: "SouthWest")
    # @airline5 = Airline.create!(Name: "United")

    @flight1 = @airline1.flights.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    @flight2 = @airline1.flights.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
    @flight3 = @airline2.flights.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City")
    @flight4 = @airline2.flights.create!(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno")

    @passenger1 = Passenger.create!(name: 'Cory', age: 32)
    @passenger2 = Passenger.create!(name: 'Bill', age: 2)
    @passenger3 = Passenger.create!(name: 'Alex', age: 55)
    @passenger4 = Passenger.create!(name: 'Tim', age: 11)
    @passenger5 = Passenger.create!(name: 'Jim', age: 44)
    @passenger6 = Passenger.create!(name: 'Kit', age: 57)
    @passenger7 = Passenger.create!(name: 'Dead', age: 100)

    @passflight1 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @passflight2 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @passflight3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @passflight4 = PassengerFlight.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
    @passflight5 = PassengerFlight.create!(passenger_id: @passenger5.id, flight_id: @flight2.id)
    @passflight6 = PassengerFlight.create!(passenger_id: @passenger6.id, flight_id: @flight1.id)
    @passflight7 = PassengerFlight.create!(passenger_id: @passenger7.id, flight_id: @flight4.id)
  end

  it "displays a list of adult passengers with a flight with the given airline " do
    visit "/airlines/#{@airline1.id}"

    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger6.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to have_content(@passenger5.name)
    expect(page).to_not have_content(@passenger4.name)
    expect(page).to_not have_content(@passenger2.name)
    expect(page).to_not have_content(@passenger7.name)
  end

end
