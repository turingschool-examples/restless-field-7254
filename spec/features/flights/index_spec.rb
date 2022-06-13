require 'rails_helper'

RSpec.describe "flight index" do
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
    @passenger2 = Passenger.create!(name: 'Bill', age: 27)
    @passenger3 = Passenger.create!(name: 'Alex', age: 15)
    @passenger4 = Passenger.create!(name: 'Tim', age: 11)

    @passflight1 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @passflight2 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @passflight3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @passflight4 = PassengerFlight.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
  end

  it "lists all flights, their airline, and all passengers on the flight" do
    visit "/flights"

    within(".flight-#{@flight1.id}") do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@airline1.name)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
      expect(page).to_not have_content(@passenger4.name)
      expect(page).to_not have_content(@airline2.name)
      expect(page).to_not have_content(@flight2.number)
    end
  end
end
