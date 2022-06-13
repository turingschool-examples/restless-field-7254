require 'rails_helper'

RSpec.describe 'airline show page' do 
  let!(:airline_1) { Airline.create(name: "Fly Home") }
  let!(:flight_1) { airline_1.flights.create(number: 1, date: '6/21/22', departure_city: "Denver", arrival_city: "Idaho Falls") }
  let!(:flight_2) { airline_1.flights.create(number: 2, date: '6/29/22', departure_city: "Idaho Falls", arrival_city: "Denver") }
  let!(:passenger_1) { flight_1.passengers.create(name: "Hank" , age: 30 ) }
  let!(:passenger_2) { flight_1.passengers.create(name: "Sam", age: 40 ) }
  let!(:passenger_3) { flight_2.passengers.create(name: "Tom", age: 15 ) }
  let!(:passenger_4) { flight_2.passengers.create(name: "Don", age: 20 ) }

  let!(:passenger_5) { flight_1.passengers.create(name: "Don", age: 20 ) }

  it 'shows list of unique adult passengers on airline' do 
    visit airline_path(airline_1.id)

    expect(page).to have_content(passenger_1.name)
    expect(page).to have_content(passenger_2.name)
    expect(page).to have_content(passenger_4.name, count: 1) #only unique passengers
    expect(page).to_not have_content(passenger_3.name) #no passenger under 18 
  end
end