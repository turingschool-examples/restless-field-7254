require 'rails_helper'

RSpec.describe 'Ariline Show Page', type: :feature do
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
    @passenger_5 = Passenger.create!(name:'Adam', age:17)
    @passenger_6 = Passenger.create!(name:'Macy', age:55)

    @passenger_flight_1 = PassengerFlight.create!(passenger_id:@passenger_1.id, flight_id:@flight_1.id)
    @passenger_flight_2 = PassengerFlight.create!(passenger_id:@passenger_2.id, flight_id:@flight_1.id)
    @passenger_flight_3 = PassengerFlight.create!(passenger_id:@passenger_3.id, flight_id:@flight_1.id)
    @passenger_flight_4 = PassengerFlight.create!(passenger_id:@passenger_4.id, flight_id:@flight_1.id)
    @passenger_flight_5 = PassengerFlight.create!(passenger_id:@passenger_1.id, flight_id:@flight_2.id)
    @passenger_flight_6 = PassengerFlight.create!(passenger_id:@passenger_2.id, flight_id:@flight_2.id)
    @passenger_flight_7 = PassengerFlight.create!(passenger_id:@passenger_5.id, flight_id:@flight_1.id)
    @passenger_flight_8 = PassengerFlight.create!(passenger_id:@passenger_6.id, flight_id:@flight_1.id)
  end

  it 'lists all the distinct adult(over 18) passengers on this arilines flights' do
    visit airline_path(@airline_1)

    within '#passengers' do
      expect(page).to have_content('Passengers:')
      expect(page).to have_content('Ryan')
      expect(page).to have_content('Stacy')
      expect(page).to have_content('Maddie')
      expect(page).to have_content('Macy')

      # shouldnt be on page
      expect(page).to_not have_content('Adam')
      expect(page).to_not have_content('Jack')
    end
  end
end
