require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }


  it 'can create a list of distinct passengers above 18 years old on this airlines flight' do
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

    expect(@airline_1.distinct_adult_passengers).to eq([@passenger_6.name, @passenger_4.name,
                                                        @passenger_2.name, @passenger_3.name])
  end
end
