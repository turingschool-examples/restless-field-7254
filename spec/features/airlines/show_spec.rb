require "rails_helper"

RSpec.describe "Airlines show page" do
  before :each do
    @airline1 = Airline.create!(name: "American")


    @flight1 = Flight.create!(number: "7790", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: "#{@airline1.id}")

    @bre = Passenger.create!(name: "Brennan Lee Mulligan", age: 13)
    @aab = Passenger.create!(name: "Aabria Iyengar", age: 9)
    @bill = Passenger.create!(name: "Bill Seacaster", age: 46)
    @misty = Passenger.create!(name: "Misty Moore", age: 44)
    @colin = Passenger.create!(name: "Colin", age: 33)

    @fp1 = FlightPassenger.create!(passenger_id: "#{@bre.id}", flight_id: "#{@flight1.id}")
    @fp2 = FlightPassenger.create!(passenger_id: "#{@aab.id}", flight_id: "#{@flight1.id}")
    @fp3 = FlightPassenger.create!(passenger_id: "#{@bill.id}", flight_id: "#{@flight1.id}")
    @fp3 = FlightPassenger.create!(passenger_id: "#{@misty.id}", flight_id: "#{@flight1.id}")

    visit airline_path(@airline1)
  end

  it "lists passengers over 18 that have flights with airline" do
    expect(page).to have_content(@bill.name)
    expect(page).to have_content(@misty.name)

    expect(page).to_not have_content(@bre.name)
    expect(page).to_not have_content(@aab.name)
    expect(page).to_not have_content(@colin.name)
  end

end
