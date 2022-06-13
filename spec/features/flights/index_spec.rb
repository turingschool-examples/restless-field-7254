require 'rails_helper'

RSpec.describe "flight index" do
  before(:each) do
    @airline1 = Airline.create!(Name: "American")
    @airline2 = Airline.create!(Name: "Delta")
    @airline3 = Airline.create!(Name: "JetBlue")
    @airline4 = Airline.create!(Name: "SouthWest")
    @airline5 = Airline.create!(Name: "United")

    @flight1 = @airline1.flights.create!(Number: "7990", Date: "2/7/2022", Departure City: "Glendale", Arrival City: "Dallas")
    @flight2 = @airline1.flights.create!(Number: "3940", Date: "3/10/2022", Departure City: "Detroit", Arrival City: "Orlando")
    @flight3 = @airline2.flights.create!(Number: "9091", Date: "5/17/2022", Departure City: "Chicago", Arrival City: "Kansas City")
    @flight4 = @airline2.flights.create!(Number: "6798", Date: "10/9/2022", Departure City: "Tulsa", Arrival City: "Fresno")

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

    within("#flight-#{@flight1.id}") do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight1.airline.name)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
    end
  end
end
