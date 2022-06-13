require "rails_helper"

RSpec.describe "Airline Show Page" do
  before :each do
    Airline.destroy_all
    @united = Airline.create!(name: "United Airlines")
    @flight1 = @united.flights.create!(number: 1234, date: "01-01-2020", departure_city: "Denver", arrival_city: "Dayton")
    @flight2 = @united.flights.create!(number: 5678, date: "01-01-2021", departure_city: "Baton Rouge", arrival_city: "New Orleans")
    @nick = Passenger.create!(name: "Nick", age: 31)
    @mike = Passenger.create(name: "MikeDao", age: 99)
    @jenn = Passenger.create(name: "Squirrel Girl", age: 17)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @nick.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @mike.id)
    FlightPassenger.create(flight_id: @flight1.id, passenger_id: @jenn.id)

    visit airline_path(@united.id)
  end

  it "lists unique passengers that are on this airlines flights" do
    expect(page).to have_content("Passengers on this Airline: Nick, MikeDao")

    expect(page).to_not have_content("Squirrel Girl")
  end

end
