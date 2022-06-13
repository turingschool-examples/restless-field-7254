require 'rails_helper'

RSpec.describe 'airline show page' do 
  let!(:airline_1) { Airline.create!(name: "Fly Away") }
  # let!(:airline_2) { Airline.create!(name: "Fly Home") }

  let!(:flight_1) { airline_1.flights.create!(number: 1, date: '6/21/22', departure_city: "Denver", arrival_city: "Idaho Falls") }
  let!(:flight_2) { airline_1.flights.create!(number: 2, date: '6/29/22', departure_city: "Idaho Falls", arrival_city: "Denver") }
  let!(:flight_3) { airline_1.flights.create!(number: 2, date: '7/01/22', departure_city: "Denver", arrival_city: "Las Vegas") }

  let!(:passenger_1) { Passenger.create!(name: "Hank" , age: 30 ) }
  let!(:passenger_2) { Passenger.create!(name: "Sam", age: 40 ) }
  let!(:passenger_3) { Passenger.create!(name: "Tom", age: 15 ) }
  let!(:passenger_4) { Passenger.create!(name: "Don", age: 20 ) }

  let!(:fp_1) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger_1.id)}
  let!(:fp_2) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_1.id)}
  let!(:fp_3) { FlightPassenger.create!(flight_id: flight_3.id, passenger_id: passenger_1.id)}

  let!(:fp_4) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger_2.id)}
  let!(:fp_5) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_2.id)}

  let!(:fp_6) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_3.id)}
  let!(:fp_7) { FlightPassenger.create!(flight_id: flight_3.id, passenger_id: passenger_3.id)}

  let!(:fp_8) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger_4.id)}



  it 'shows list of unique adult passengers on airline' do 
    visit airline_path(airline_1.id)

    expect(page).to have_content(passenger_1.name, count: 1) #only unique passengers
    expect(page).to have_content(passenger_1.age) #only unique passengers
    expect(page).to have_content(passenger_2.name)
    expect(page).to have_content(passenger_2.age)
    expect(page).to have_content(passenger_4.name) 
    expect(page).to have_content(passenger_4.age) 
    expect(page).to_not have_content(passenger_3.name) #no passenger under 18 
  end

end