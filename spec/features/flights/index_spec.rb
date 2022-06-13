require 'rails_helper'

RSpec.describe 'Flights Index Page' do
    before :each do
        @american = Airline.create!(name: 'American')
        @delta = Airline.create!(name: 'Delta')
        @southwest = Airline.create!(name: 'Southwest')
        @flight_1 = @american.flights.create!(number: '1', date: '01/01/2201', departure_city: "San Francisco", arrival_city: "New York City")
        @flight_2 = @american.flights.create!(number: '2', date: '01/01/2202', departure_city: "Dallas", arrival_city: "Denver")
        @flight_3 = @delta.flights.create!(number: '3', date: '01/01/2203', departure_city: "New Orleans", arrival_city: "Los Angeles")
        @flight_4 = @delta.flights.create!(number: '4', date: '01/01/2204', departure_city: "Charollete", arrival_city: "Seattle")
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
        FlightPassenger.create!(flight: @flight_2, passenger: @mary)
        FlightPassenger.create!(flight: @flight_3, passenger: @bob)
        FlightPassenger.create!(flight: @flight_3, passenger: @tom)
        FlightPassenger.create!(flight: @flight_3, passenger: @joe)
    end

    describe "the flights index page" do
        it "displays all flight numbers, their airline and all passengers associated the flight" do
            visit flights_path
            within "#flight-#{@flight_1.id}" do
                expect(page).to have_content("Flight Number: 1")
                expect(page).to have_content("Airline: American")
                expect(page).to have_content("Bob")
                expect(page).to have_content("Jane")
                expect(page).to have_content("Alex")
                expect(page).to_not have_content("Mary")
                expect(page).to_not have_content("Flight Number: 2")
            end
            within "#flight-#{@flight_2.id}" do
                expect(page).to have_content("Flight Number: 2")
                expect(page).to have_content("Airline: American")
                expect(page).to have_content("Bob")
                expect(page).to have_content("Mary")
                expect(page).to_not have_content("Joe")
                expect(page).to_not have_content("Delta")
            end
            within "#flight-#{@flight_3.id}" do
                expect(page).to have_content("Flight Number: 3")
                expect(page).to have_content("Airline: Delta")
                expect(page).to have_content("Bob")
                expect(page).to have_content("Tom")
                expect(page).to have_content("Joe")
                expect(page).to_not have_content("Alex")
                expect(page).to_not have_content("American")
            end
        end
        
        it "has a buttom next to each passenger to remove them from a flight" do
            visit flights_path
            within "#flight-#{@flight_1.id}" do
                expect(page).to have_content("Bob")
                expect(page).to have_content("Jane")
                expect(page).to have_content("Alex")
                click_button 'Remove Jane'
                expect(page).to have_content("Bob")
                expect(page).to_not have_content("Jane")
                expect(page).to have_content("Alex")
                click_button 'Remove Bob'
                expect(page).to_not have_content("Bob")
                expect(page).to_not have_content("Jane")
                expect(page).to have_content("Alex")
            end
            within "#flight-#{@flight_2.id}" do
                expect(page).to have_content("Bob")
                expect(page).to have_content("Mary")
                click_button 'Remove Bob'
                click_button 'Remove Mary'
                expect(page).to_not have_content("Bob")
                expect(page).to_not have_content("Mary")
            end
        end
        
    end
    
end