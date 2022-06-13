require 'rails_helper'

describe 'airline show page' do
  before do
    @airline1 = Airline.create!(name: "JetBlue")
    @airline2 = Airline.create!(name: "Hawaiian")

    @flight1 = @airline1.flights.create!(number: 1, date: "5/19/22", arrival_city: "NYC", departure_city: "San Fran")
    @flight2 = @airline1.flights.create!(number: 2, date: "5/23/22", arrival_city: "Honolulu", departure_city: "Denver")
    @flight3 = @airline1.flights.create!(number: 3, date: "5/23/22", arrival_city: "Detroit", departure_city: "Orlando")

    @pass1 = Passenger.create!(name: "Jenn", age: 29)
    @pass2 = Passenger.create!(name: "Eric", age: 18)
    @pass3 = Passenger.create!(name: "Liz", age: 16)
    @pass4 = Passenger.create!(name: "Rory", age: 32)

    FlightPassenger.create!(flight: @flight1, passenger: @pass1)
    FlightPassenger.create!(flight: @flight2, passenger: @pass1)
    FlightPassenger.create!(flight: @flight3, passenger: @pass1)
    FlightPassenger.create!(flight: @flight1, passenger: @pass2)
    FlightPassenger.create!(flight: @flight2, passenger: @pass2)
    FlightPassenger.create!(flight: @flight1, passenger: @pass3)
    FlightPassenger.create!(flight: @flight1, passenger: @pass4)

    visit airline_path(@airline1)
  end

  it "displays the unique adult passengers that have flights on that airline" do

    expect(page).to have_content("JetBlue")
    expect(page).to_not have_content("Hawaiian")

    expect(page).to have_content("Jenn", count: 1)
    expect(page).to have_content("Rory", count: 1)
    expect(page).to have_content("Eric")
    expect(page).to_not have_content("Liz")
  end

  it "orders passengers by most frequent flyers" do

    expect("Jenn").to appear_before("Eric")
    expect("Eric").to appear_before("Rory")
  end
end
