require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
end

describe 'Instance Methods' do
  before :each do
    @airline1 = Airline.create!(name: "American")

    @flight1 = Flight.create!(number: "7790", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: "#{@airline1.id}")
    @flight2 = Flight.create!(number: "7790", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: "#{@airline1.id}")

    @bre = Passenger.create!(name: "Brennan Lee Mulligan", age: 13)
    @aab = Passenger.create!(name: "Aabria Iyengar", age: 9)
    @bill = Passenger.create!(name: "Bill Seacaster", age: 18) #to make sure 18 year olds are included
    @misty = Passenger.create!(name: "Misty Moore", age: 44)
    @colin = Passenger.create!(name: "Colin", age: 33)

    @fp1 = FlightPassenger.create!(passenger_id: "#{@bre.id}", flight_id: "#{@flight1.id}")
    @fp2 = FlightPassenger.create!(passenger_id: "#{@aab.id}", flight_id: "#{@flight1.id}")
    @fp3 = FlightPassenger.create!(passenger_id: "#{@bill.id}", flight_id: "#{@flight1.id}")
    @fp4 = FlightPassenger.create!(passenger_id: "#{@misty.id}", flight_id: "#{@flight1.id}")
    @fp5 = FlightPassenger.create!(passenger_id: "#{@misty.id}", flight_id: "#{@flight2.id}")
  end

  it "#passengers_over_18_by_frequency" do
    expect(@airline1.passengers_over_18_by_frequency[0].name).to eq("Misty Moore")
    expect(@airline1.passengers_over_18_by_frequency[1].name).to eq("Bill Seacaster")
  end
end
