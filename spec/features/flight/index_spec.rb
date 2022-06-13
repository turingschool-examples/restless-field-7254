require 'rails_helper'

RSpec.describe 'Flights index page', type: :feature do
  before :each do
    @airline_1 = Airline.create!(name:'Southwest')

    @flight_1 = Flight.create!(number:'5543', date:'1/14/22', departure_city: 'Atlanta',
                                                          arrival_city:'Phoenix', airline_id:@airline_1.id)
    @flight_2 = Flight.create!(number:'5544', date:'1/15/22', departure_city: 'New York',
                                                          arrival_city:'Dallas', airline_id:@airline_1.id)
    @flight_3 = Flight.create!(number:'5545', date:'1/16/22', departure_city: 'Waco',
                                                          arrival_city:'Denver', airline_id:@airline_1.id)
    @passenger_1 = Passenger.create!(name:'Jack', age:15)
    @passenger_2 = Passenger.create!(name:'Ryan', age:35)
    @passenger_3 = Passenger.create!(name:'Stacy', age:23)
    @passenger_4 = Passenger.create!(name:'Maddie', age:36)

    @passenger_flight_1 = PassengerFlight.create!(passenger_id:@passenger_1.id, flight_id:@flight_1.id)
    @passenger_flight_2 = PassengerFlight.create!(passenger_id:@passenger_2.id, flight_id:@flight_1.id)
    @passenger_flight_3 = PassengerFlight.create!(passenger_id:@passenger_3.id, flight_id:@flight_1.id)
    @passenger_flight_4 = PassengerFlight.create!(passenger_id:@passenger_4.id, flight_id:@flight_1.id)

    @passenger_flight_2 = PassengerFlight.create!(passenger_id:@passenger_2.id, flight_id:@flight_2.id)
    @passenger_flight_3 = PassengerFlight.create!(passenger_id:@passenger_3.id, flight_id:@flight_2.id)
    @passenger_flight_4 = PassengerFlight.create!(passenger_id:@passenger_4.id, flight_id:@flight_2.id)

    @passenger_flight_2 = PassengerFlight.create!(passenger_id:@passenger_2.id, flight_id:@flight_3.id)
    @passenger_flight_3 = PassengerFlight.create!(passenger_id:@passenger_3.id, flight_id:@flight_3.id)
  end

  it 'displays the list of flight numbers, and beneath each number we see the passengers' do
    visit flights_path

    within "#flight-#{@flight_1.id}" do
      expect(page).to have_content('Flight Number: 5543')
      expect(page).to have_content('Airline: Southwest')
      expect(page).to have_content('Passengers:')
      expect(page).to have_content('Jack')
      expect(page).to have_content('Ryan')
      expect(page).to have_content('Stacy')
      expect(page).to have_content('Maddie')
    end

    within "#flight-#{@flight_2.id}" do
      expect(page).to have_content('Flight Number: 5544')
      expect(page).to have_content('Airline: Southwest')
      expect(page).to have_content('Passengers:')
      expect(page).to have_content('Ryan')
      expect(page).to have_content('Stacy')
      expect(page).to have_content('Maddie')
    end

    within "#flight-#{@flight_3.id}" do
      expect(page).to have_content('Flight Number: 5545')
      expect(page).to have_content('Airline: Southwest')
      expect(page).to have_content('Passengers:')
      expect(page).to have_content('Ryan')
      expect(page).to have_content('Stacy')
      expect(page).to_not have_content('Maddie')
      expect(page).to_not have_content('Jack')
    end
  end

  it 'allows for the removal of a passenger from a fligt' do
    visit flights_path


    within "#passenger-#{@passenger_1.name}" do
      expect(page).to have_link('Remove Passenger From Flight')
      click_on 'Remove Passenger From Flight'
    end

    expect(current_path).to eq(flights_path)

    expect(page).to_not have_content('Jack')
  end
end
