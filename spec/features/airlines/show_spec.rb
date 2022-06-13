require 'rails_helper'

RSpec.describe 'Flights Index' do
  before :each do
    @delta = Airline.create!(name: "Delta")
    @flight_1 = Flight.create!(number: "3124", date: "Sept 3, 1999", departure_city: "NYC", arrival_city: "Cuzco", airline_id: @delta.id)
    @flight_2 = Flight.create!(number: "4352", date: "Jan 10, 1999", departure_city: "NYC", arrival_city: "Montreal", airline_id: @delta.id)
    @flight_3 = Flight.create!(number: "6467", date: "July 7, 1999", departure_city: "NYC", arrival_city: "DC", airline_id: @delta.id)
    @sam = Passenger.create!(name: "Sam", age: 14)
    @julia = Passenger.create!(name: "Julia", age: 12)
    @horatio = Passenger.create!(name: "Horatio", age: 33)
    @quincy = Passenger.create!(name: "Quincy", age: 30)
    @lydia = Passenger.create!(name: "Lydia", age: 6)
    @deana = Passenger.create!(name: "Deana", age: 20)
    @elena = Passenger.create!(name: "Elena", age: 25)
    @flight_passenger_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @sam.id)
    @flight_passenger_2 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @sam.id)
    @flight_passenger_3 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @julia.id)
    @flight_passenger_4 = FlightPassenger.create!(flight_id: @flight_3.id, passenger_id: @horatio.id)
    @flight_passenger_5 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @horatio.id)
    @flight_passenger_6 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @deana.id)
  end

  it 'shows all unique adult passengers' do
    visit "/airlines/#{@delta.id}"

    expect(page).to have_content("Horatio")
    expect(page).to have_content("Deana")
  end
end
