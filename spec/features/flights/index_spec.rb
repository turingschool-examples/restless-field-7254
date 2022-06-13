require 'rails_helper'

describe 'flights index page' do
  before do
    @airline1 = Airline.create!(name: "JetBlue")
    @airline2 = Airline.create!(name: "Hawaiian")

    @flight1 = @airline1.flights.create!(number: 1, date: "5/19/22", arrival_city: "NYC", departure_city: "San Fran")
    @flight2 = @airline2.flights.create!(number: 2, date: "5/23/22", arrival_city: "Honolulu", departure_city: "Denver")
    # @flight3 = @airline1.flights.create!(number: 2, date: "5/20/22", arrival_city: "Oakland", departure_city: "Las Vegas")

    @pass1 = Passenger.create!(name: "Jenn", age: 29)
    @pass2 = Passenger.create!(name: "Eric", age: 31)
    @pass3 = Passenger.create!(name: "Liz", age: 28)
    @pass4 = Passenger.create!(name: "Rory", age: 32)

    FlightPassenger.create!(flight: @flight1, passenger: @pass1)
    FlightPassenger.create!(flight: @flight1, passenger: @pass2)
    FlightPassenger.create!(flight: @flight1, passenger: @pass3)
    FlightPassenger.create!(flight: @flight2, passenger: @pass4)

    visit flights_path
  end

  it "lists all flight numbers, name of flight airline, and all passengers" do
    within "#flight-#{@flight1.id}" do
      expect(page).to have_content("Flight Number: 1")
      expect(page).to_not have_content("Flight Number: 2")

      expect(page).to have_content("Airline: Jetblue")
      expect(page).to_not have_content("Airline: Hawaiian")

      expect(page).to have_content("Jenn")
      expect(page).to have_content("Eric")
      expect(page).to have_content("Liz")
      expect(page).to_not have_content("Rory")
    end

    within "#flight-#{@flight2.id}" do
      expect(page).to have_content("Flight Number: 2")
      expect(page).to_not have_content("Flight Number: 1")

      expect(page).to have_content("Airline: Hawaiian")
      expect(page).to_not have_content("Airline: Jetblue")

      expect(page).to have_content("Rory")
      expect(page).to_not have_content("Jenn")
      expect(page).to_not have_content("Eric")
      expect(page).to_not have_content("Liz")
    end
  end
end
