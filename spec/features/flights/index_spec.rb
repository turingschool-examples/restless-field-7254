require "rails_helper"

RSpec.describe "Flights index page" do
  before :each do
    @airline1 = Airline.create!(name: "American")
    @airline2 = Airline.create!(name: "Delta")
    @airline3 = Airline.create!(name: "JetBlue")
    @airline4 = Airline.create!(name: "Southwest")
    @airline5 = Airline.create!(name: "United")

    @flight1 = Flight.create!(number: "7790", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: "#{@airline1.id}")
    @flight2 = Flight.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: "#{@airline2.id}")
    @flight3 = Flight.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: "#{@airline3.id}")

    @bre = Passenger.create!(name: "Brennan Lee Mulligan", age: 13)
    @aab = Passenger.create!(name: "Aabria Iyengar", age: 9)
    @bill = Passenger.create!(name: "Bill Seacaster", age: 46)
    @misty = Passenger.create!(name: "Misty Moore", age: 44)
  end

  it "shows all flight numbers" do
    visit "/flights"

    expect(page).to have_content("7790")
    expect(page).to have_content("3940")
    expect(page).to have_content("9091")
  end
end
