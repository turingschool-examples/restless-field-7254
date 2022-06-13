require 'rails_helper'

RSpec.describe Flight, type: :feature do
  describe 'visitors on flight index' do
    before(:each) do
      @delta = Airline.create!(name: 'delta')
      @flight_1 = @delta.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
      @steve = Passenger.create!(name: 'steve', age: 29)
      @frank = Passenger.create!(name: 'frank', age: 27)
      @flight_pass_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @steve.id)
      @flight_pass_2 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @frank.id)
      @delta = Airline.create!(name: 'Delta')
      @flight_2 = @delta.flights.create!(number: '2', date: '1/2/22', departure_city: 'Denver', arrival_city: 'Saigon')
      @jimmy = Passenger.create!(name: 'Jimmy', age: 29)
      @jordan = Passenger.create!(name: 'Jordan', age: 27)
      @flight_pass_3 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @jimmy.id)
      @flight_pass_4 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @jordan.id)
   
      visit "/flights"
    end
 
    it 'displays all flight, their airline, and their passenger list' do
      expect(page).to have_content("Flight: #{@flight_1.number} Airline: #{@delta.name}")
      expect(page).to have_content("Passengers: #{@steve.name} #{@frank.name}")
      expect(page).to have_content("Flight: #{@flight_2.number} Airline: #{@delta.name}")
      expect(page).to have_content("Passengers: #{@jordan.name} #{@jimmy.name}")
    end

    it "next to each passenger on the page is a button that will remove the passenger from the flight when clicked but not delete the customer record" do
      within("#passenger-#{@steve.id}") do
        expect(page).to have_button("BuhBye #{@steve.name}")
          click_button("BuhBye #{@steve.name}")
        expect(current_path).to eq("/flights")
        expect(page).to_not have_content(@steve.name)
      end
    end
  end
end