require "rails_helper"

RSpec.describe Airline, type: :feature do
  it 'I see a unique list of adult passengers that have flights on that airline' do
    @frontier = Airline.create!(name: 'Frontier')
    @flight_1 = @frontier.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
    @seth = Passenger.create!(name: 'Seth', age: 29)
    @sam = Passenger.create!(name: 'Sam', age: 27)
    @flight_pass_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @seth.id)
    @flight_pass_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @sam.id)
    @flight_2 = @frontier.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')
    @jim = Passenger.create!(name: 'Jim', age: 29)
    @josh = Passenger.create!(name: 'Josh', age: 17)
    @flight_pass_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @jim.id)
    @flight_pass_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @josh.id)
    @flight_pass_5 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @seth.id)
    visit "/airlines/#{@frontier.id}"
  
    expect(page).to have_content("Passengers: #{@seth.name} #{@sam.name} #{@jim.name}")
    expect(page).to_not have_content(@josh.name)
  end

  describe 'sorted list on show page' do 
    it 'I see the list is sorted by the number of flights taken, most to least' do
      @southwest = Airline.create!(name: 'Southwest')
      @flight_1 = @southwest.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'LAX')
      @chris = Passenger.create!(name: 'Chris', age: 29)
      @nora = Passenger.create!(name: 'Nora', age: 27)  
      @flight_pass_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @chris.id)
      @flight_pass_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @nora.id)
      @flight_2 = @southwest.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')
      @tony = Passenger.create!(name: 'tony', age: 29)
      @josh = Passenger.create!(name: 'Josh', age: 17)
      @flight_pass_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @tony.id)
      @flight_pass_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @josh.id)
      @flight_pass_5 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @chris.id)
      @flight_3 = @southwest.flights.create!(number: '3', date: '1/2/22', departure_city: 'Denver', arrival_city: 'DC')
      @flight_pass_6 = FlightPassenger.create!(flight_id: @flight_3.id, passenger_id: @chris.id)
      @flight_pass_7 = FlightPassenger.create!(flight_id: @flight_3.id, passenger_id: @nora.id)
      visit "/airlines/#{@southwest.id}"

      expect(page).to have_content("Passengers: #{@chris.name} #{@nora.name} #{@tony.name}")
    end
  end
end
