require 'rails_helper'

RSpec.describe "flight index page" do
  before :each do
    Airline.destroy_all
    @united = Airline.create!(name: "United Airlines")
    @flight1 = @united.flights.create!(number: 1234, date: "01-01-2020", departure_city: "Denver", arrival_city: "Dayton")
    @flight2 = @united.flights.create!(number: 5678, date: "01-01-2021", departure_city: "Baton Rouge", arrival_city: "New Orleans")
    @nick = Passenger.create!(name: "Nick", age: 31)
    @sarah = Passenger.create(name: "Sarah", age: 99)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @nick.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @sarah.id)

    visit flights_path
  end

  it "shows all flight numbers with airline name" do
    expect(page).to have_content("Flight Number: 1234")
    expect(page).to have_content("Flight Number: 5678")
    expect(page).to have_content("Airline: United Airlines")
    expect(page).to have_content("Passengers: Nick")
    expect(page).to have_content("Passengers: Sarah")
  end

  it "can delete a passenger from a flight" do
    expect(page).to have_content("Passengers: Nick")
    expect(page).to have_button("Remove Passenger", count: 2)

    click_button("Remove Passenger", match: :first)
    expect(current_path).to eq(flights_path)

    expect(page).to have_button("Remove Passenger", count: 1)

    expect(page).to_not have_content("Passengers: Nick")
  end

end
