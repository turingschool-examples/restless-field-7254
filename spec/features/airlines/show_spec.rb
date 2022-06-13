require 'rails_helper'

RSpec.describe 'airline show page', type: :feature do
  before :each do
    @spirit = Airline.create!(name: "Spirit")
    @united = Airline.create!(name: "United")
    @flight1 = @spirit.flights.create!(number: 123, date: "07/18/22",
      departure_city: "Chicago", arrival_city: "Houston")
    @flight2 = @spirit.flights.create!(number: 234, date: "07/24/22",
      departure_city: "Houston", arrival_city: "Chicago")
    @flight3 = @spirit.flights.create!(number: 345, date: "07/19/22",
      departure_city: "Chicago", arrival_city: "Denver")
    @flight4 = @united.flights.create!(number: 456, date: "07/21/22",
      departure_city: "Chicago", arrival_city: "Seattle")
    @bob = Passenger.create!(name: "Bob", age: 35)
    @joe = Passenger.create!(name: "Joe", age: 40)
    @carol = Passenger.create!(name: "Carol", age: 11)
    @rick = Passenger.create!(name: "Rick", age: 13)
    @shane = Passenger.create!(name: "Shane", age: 18)
    @jack = Passenger.create!(name: "Jack", age: 18)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @bob.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @bob.id)
    FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @bob.id)
    FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @joe.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @joe.id)
    FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @joe.id)
    FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @joe.id)
    FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @carol.id)
    FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @rick.id)
    FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @shane.id)
    FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @jack.id)
  end

  it 'shows all passengers that are 18 or older' do
    visit "/airlines/#{@spirit.id}"
    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@joe.name)
    expect(page).to_not have_content(@carol.name)
    expect(page).to_not have_content(@rick.name)
    expect(page).to_not have_content(@jack.name)
    expect(page).to have_content(@shane.name)
  end

  it 'lists in order of flights with airline' do
    visit "/airlines/#{@spirit.id}"
    within "#passenger-0" do
      expect(page).to have_content(@joe.name)
      expect(page).to_not have_content(@carol.name)
      expect(page).to_not have_content(@shane.name)
      expect(page).to_not have_content(@bob.name)
      expect(page).to_not have_content(@rick.name)
      expect(page).to_not have_content(@jack.name)   
    end
    within "#passenger-1" do
      expect(page).to have_content(@bob.name)
      expect(page).to_not have_content(@shane.name)
      expect(page).to_not have_content(@joe.name)
      expect(page).to_not have_content(@carol.name)
      expect(page).to_not have_content(@rick.name)
      expect(page).to_not have_content(@jack.name)
    end  

    within "#passenger-2" do
      expect(page).to have_content(@shane.name)
      expect(page).to_not have_content(@carol.name)
      expect(page).to_not have_content(@rick.name)
      expect(page).to_not have_content(@jack.name)
      expect(page).to_not have_content(@bob.name)
      expect(page).to_not have_content(@joe.name)
    end
      
  end

end