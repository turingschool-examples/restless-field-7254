require 'rails_helper'

RSpec.describe Flight, type: :feature do
  describe 'visitors on flight index' do
    before(:each) do
      @delta = Airline.create!(name: 'Delta')
      @flight_1 = @delta.flights.create!(number: '1', date: '1/1/22', departure_city: 'Denver', arrival_city: 'DC')
      @steve = Passenger.create!(name: 'Steve', age: 29)
      @frank = Passenger.create!(name: 'Frank', age: 27)
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
        save_and_open_page
      within("#flight-#{@flight_1.id}") do
        expect(page).to have_content("Flight: 1 Airline: Delta")
        expect(page).to have_content("Steve")
        expect(page).to have_content("Frank")
      end 
      within("#flight-#{@flight_2.id}") do
        expect(page).to have_content("Flight: 2 Airline: Delta")
        expect(page).to have_content("Jimmy")
        expect(page).to have_content("Jordan")
      end
    end

    it "next to each passenger on the page is a button that will remove the passenger from the flight when clicked but not delete the customer record" do
        expect(page).to have_button("BuhBye Steve")
          click_button("BuhBye Steve")

        expect(current_path).to eq("/flights")
        expect(page).to_not have_content(@steve.name)
      
    end
  end
end