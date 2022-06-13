require 'rails_helper'

RSpec.describe 'flights index page' do 
  let!(:airline_1) { Airline.create(name: "Fly Away") }
  let!(:airline_2) { Airline.create(name: "Fly Home") }
  let!(:flight_1) { airline_1.flights.create(number: 1, date: '6/21/22', departure_city: "Denver", arrival_city: "Idaho Falls") }
  let!(:flight_2) { airline_2.flights.create(number: 2, date: '6/29/22', departure_city: "Idaho Falls", arrival_city: "Denver") }
  let!(:passenger_1) { flight_1.passengers.create(name: "Hank" , age: 30 ) }
  let!(:passenger_2) { flight_1.passengers.create(name: "Sam", age: 40 ) }
  let!(:passenger_3) { flight_2.passengers.create(name: "Tom", age: 15 ) }
  let!(:passenger_4) { flight_2.passengers.create(name: "Don", age: 20 ) }

  it 'shows list of all flight numbers and airline names' do 
    visit flights_path

    within("##{flight_1.id}") do 
      expect(page).to have_content(flight_1.number)
      expect(page).to have_content(airline_1.name)
      expect(page).to_not have_content(flight_2.number)
    end 

    within("##{flight_2.id}") do 
      expect(page).to have_content(flight_2.number)
      expect(page).to have_content(airline_2.name)
      expect(page).to_not have_content(flight_1.number)
    end 
  end

  it 'shows a list of all of the flights passengers' do 
    visit flights_path

    within("##{flight_1.id}") do 
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to_not have_content(passenger_3.name)
    end 

    within("##{flight_2.id}") do 
      expect(page).to have_content(passenger_3.name)
      expect(page).to have_content(passenger_4.name)
      expect(page).to_not have_content(passenger_1.name)
    end 
  end

  it 'can remove a passenger from flight' do 
    visit flights_path

    within("##{passenger_1.id}") do 
    expect(page).to have_content(passenger_1.name)
     click_button "Remove Passenger"
    end 

    expect(current_path).to eq(flights_path)
    expect(page).to_not have_content(passenger_1.name)

    within("##{passenger_3.id}") do 
    expect(page).to have_content(passenger_3.name)
     click_button "Remove Passenger"
    end 

    expect(current_path).to eq(flights_path)
    expect(page).to_not have_content(passenger_3.name)
  end
end