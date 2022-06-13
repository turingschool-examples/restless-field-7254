require 'rails_helper'

RSpec.describe 'Flights Index' do
  it 'shows a flights flight number, airline, and passengers' do
    airline1 = Airline.create!(name: 'Frontier')
    flight1 = airline1.flights.create!(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
    passenger1 = Passenger.create(name: 'Eric', age: 28)
    passenger2 = Passenger.create(name: 'Mike', age: 40)
    passenger3 = Passenger.create(name: 'Dani', age: 35)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger1.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger2.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger3.id)

    airline2 = Airline.create!(name: 'Alaska')
    flight2 = airline1.flights.create!(number: '1234', date: '08/04/20', departure_city: 'Seattle', arrival_city: 'LA')
    passenger4 = Passenger.create(name: 'Andrew', age: 30)

    FlightPassenger.create(flight_id: flight2.id, passenger_id: passenger4.id)


    visit "/flights"

    within "#flight-0" do
    expect(page).to have_content("1727")
    expect(page).to have_content("Eric")
    expect(page).to have_content("Mike")
    expect(page).to have_content("Dani")
    end

    within "#flight-1" do
    expect(page).to have_content("1234")
    expect(page).to have_content("Andrew")
    end

  end
  # As a visitor
  # When I visit the flights index page
  # Next to each passengers name
  # I see a link or button to remove that passenger from that flight
  # When I click on that link/button
  # I'm returned to the flights index page
  # And I no longer see that passenger listed under that flight
  it 'can Remove a Passenger from a Flight' do
    airline1 = Airline.create!(name: 'Frontier')
    flight1 = airline1.flights.create!(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
    passenger1 = Passenger.create(name: 'Eric', age: 28)
    passenger2 = Passenger.create(name: 'Mike', age: 40)
    passenger3 = Passenger.create(name: 'Dani', age: 35)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger1.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger2.id)
    FlightPassenger.create(flight_id: flight1.id, passenger_id: passenger3.id)

    visit "/flights"

    within "#flight-0" do
    expect(page).to have_content("Eric")
    expect(page).to have_content("Mike")
    expect(page).to have_content("Dani")
    end
    click_button "Remove #{passenger2.name} From Flight"
    expect(current_path).to eq('/flights')

    within "#flight-0" do
    expect(page).to have_content("Eric")
    expect(page).to_not have_content("Mike")
    expect(page).to have_content("Dani")
    end

  end

end
