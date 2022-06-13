require 'rails_helper'

RSpec.describe 'Flights Index' do
  before :each do
    @delta = Airline.create!(name: "Delta")
    @flight_1 = Flight.create!(number: "3124", date: "Sept 3, 1999", departure_city: "NYC", arrival_city: "Cuzco", airline_id: @delta.id)
    @flight_2 = Flight.create!(number: "4352", date: "Jan 10, 1999", departure_city: "NYC", arrival_city: "Montreal", airline_id: @delta.id)
    @flight_3 = Flight.create!(number: "6467", date: "July 7, 1999", departure_city: "NYC", arrival_city: "DC", airline_id: @delta.id)
    @sam = Passenger.create!(name: "Sam", age: 14)
    @julia = Passenger.create!(name: "Julia", age: 12)
    @horatio = Passenger.create!(name: "Horatio", age: 33)
    @quincy = Passenger.create!(name: "Quincy", age: 30)
    @lydia = Passenger.create!(name: "Lydia", age: 6)
    @deana = Passenger.create!(name: "Deana", age: 20)
    @elena = Passenger.create!(name: "Elena", age: 25)
    @flight_passenger_1 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @sam.id)
    @flight_passenger_2 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @sam.id)
    @flight_passenger_3 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @julia.id)
    @flight_passenger_4 = FlightPassenger.create!(flight_id: @flight_3.id, passenger_id: @horatio.id)
    @flight_passenger_5 = FlightPassenger.create!(flight_id: @flight_1.id, passenger_id: @horatio.id)
    @flight_passenger_6 = FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @deana.id)
  end

  it 'displays all flight numbers, airline name' do
    visit "/flights"
    save_and_open_page
    expect(page).to have_content("All Flights Info")
    expect(page).to_not have_content("Elena")
    expect(page).to_not have_content("Lydia")
    expect(page).to_not have_content("Quincy")

    within "#id-#{@flight_1.id}" do
      expect(page).to have_content("Number: 3124 Delta")
    end

    within "#id-#{@flight_2.id}" do
      expect(page).to have_content("Number: 4352 Delta")
    end

    within "#id-#{@flight_3.id}" do
      expect(page).to have_content("Number: 6467 Delta")
    end

    it 'displays all passenger names by flight' do
        visit "/flights"
      within "#id-#{@flight_1.id}" do
        expect(page).to have_content("Sam")
        expect(page).to have_content("Julia")
        expect(page).to have_content("Horatio")
        expect(page).to_not have_content("Deana")
      end

      within "#id-#{@flight_2.id}" do
        expect(page).to have_content("Sam")
        expect(page).to have_content("Deana")
      end

    within "#id-#{@flight_3.id}" do
      expect(page).to have_content("Horatio")
    end
end
  end

  it 'has a remove passenger button next to each passenger' do
    visit "/flights"

    within "#id-#{@flight_2.id}" do
      expect(page).to have_content("Deana")
      click_link "Remove #{@deana.name}"

      expect(current_path).to eq("/flights")
      expect(page).to_not have_content("Deana")
    end
  end
end
