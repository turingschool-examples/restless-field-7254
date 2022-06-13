require 'rails_helper'

RSpec.describe 'Airline Show Page' do
    before :each do
        @american = Airline.create!(name: 'American')
        @delta = Airline.create!(name: 'Delta')
        @flight_1 = @american.flights.create!(number: '1', date: '01/01/2201', departure_city: "San Francisco", arrival_city: "New York City")
        @flight_2 = @american.flights.create!(number: '2', date: '01/01/2202', departure_city: "Dallas", arrival_city: "Denver")
        @flight_3 = @american.flights.create!(number: '3', date: '01/01/2203', departure_city: "New Orleans", arrival_city: "Los Angeles")
        @flight_4 = @american.flights.create!(number: '4', date: '01/01/2204', departure_city: "Charollete", arrival_city: "Seattle")
        @bob = Passenger.create!(name: 'Bob', age: 37)
        @jane = Passenger.create!(name: 'Jane', age: 30)
        @alex = Passenger.create!(name: 'Alex', age: 47)
        @mary = Passenger.create!(name: 'Mary', age: 52)
        @tom = Passenger.create!(name: 'Tom', age: 17)
        @joe = Passenger.create!(name: 'Joe', age: 23)
        FlightPassenger.create!(flight: @flight_1, passenger: @bob)
        FlightPassenger.create!(flight: @flight_1, passenger: @jane)
        FlightPassenger.create!(flight: @flight_1, passenger: @alex)
        FlightPassenger.create!(flight: @flight_2, passenger: @bob)
        FlightPassenger.create!(flight: @flight_2, passenger: @jane)
        FlightPassenger.create!(flight: @flight_2, passenger: @mary)
        FlightPassenger.create!(flight: @flight_2, passenger: @tom)
        FlightPassenger.create!(flight: @flight_3, passenger: @bob)
        FlightPassenger.create!(flight: @flight_3, passenger: @jane)
        FlightPassenger.create!(flight: @flight_4, passenger: @jane)
        FlightPassenger.create!(flight: @flight_4, passenger: @alex)
    end

    it "list unique and adult passengers with a flight on airline" do
        visit airline_path(@american)
        expect(page).to have_content("Bob", count: 1)
        expect(page).to have_content("Jane", count: 1)
        expect(page).to have_content("Alex", count: 1)
        expect(page).to have_content("Mary", count: 1)
        expect(page).to_not have_content("Tom")
        expect(page).to_not have_content("Joe")
    end

    it "lists unique and adult passengers with a flight on airline desc order by number of flights" do
        visit airline_path(@american)
        expect("Jane").to appear_before("Bob")
        expect("Bob").to appear_before("Alex")
        expect("Alex").to appear_before("Mary")
    end
    
end