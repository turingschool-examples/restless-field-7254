require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passenger_flights).through(:flights)}

  describe 'instance methods' do
    before(:each) do
      @united = Airline.create!(name: "Wind United")
      @spirit = Airline.create!(name: "Spirit of Freedom")
      @flight1 = @united.flights.create!(number: 879, date: Date.today, departure_city: "Miami", arrival_city: "Portland")
      @flight2 = @united.flights.create!(number: 564, date: Date.today, departure_city: "Fort Myers", arrival_city: "Syracuse")
      @flight3 = @united.flights.create!(number: 231, date: Date.today, departure_city: "Port Charlotte", arrival_city: "Boston")
      @flight4 = @united.flights.create!(number: 693, date: Date.today, departure_city: "Tampa", arrival_city: "Denver")
      @flight5 = @spirit.flights.create!(number: 183, date: Date.today, departure_city: "Oneida", arrival_city: "Cancun")

      @passenger1 = Passenger.create!(name: "Jimbob", age: 18)
      @passenger2 = Passenger.create!(name: "Sally", age: 19)
      @passenger3 = Passenger.create!(name: "Pepsi", age: 5)
      @passenger4 = Passenger.create!(name: "Parker", age: 90)
      @passenger5 = Passenger.create!(name: "Deannah", age: 29)
      @passenger6 = Passenger.create!(name: "Casey", age: 25)
      @passenger7 = Passenger.create!(name: "Helen", age: 53)


      @passenger1.passenger_flights.create!(flight_id: @flight1.id)
      @passenger2.passenger_flights.create!(flight_id: @flight2.id)
      @passenger3.passenger_flights.create!(flight_id: @flight3.id)
      @passenger4.passenger_flights.create!(flight_id: @flight1.id)
      @passenger5.passenger_flights.create!(flight_id: @flight2.id)
      @passenger6.passenger_flights.create!(flight_id: @flight3.id)
      @passenger4.passenger_flights.create!(flight_id: @flight4.id)
      @passenger5.passenger_flights.create!(flight_id: @flight4.id)
      @passenger6.passenger_flights.create!(flight_id: @flight4.id)

      @passenger7.passenger_flights.create!(flight_id: @flight5.id)
    end

    it 'can return an array of passengers who are over 18 and on a flight by this airline' do
      expect(@united.all_names.pluck(:name)).to eq(["Casey", "Deannah", "Jimbob", "Parker", "Sally"])
    end
  end
end
