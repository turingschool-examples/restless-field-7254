require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }

  describe 'instance methods' do
   it 'can find adult passengers' do
      @american = Airline.create!(name: 'American')
      @delta = Airline.create!(name: 'Delta')
      @jetblue = Airline.create!(name: 'JetBlue')
      @southwest = Airline.create!(name: 'Southwest')
      @united = Airline.create!(name: 'United')

      @flight_1 = @american.flights.create!(number: '3940', date: '3/10/2022', departure_city: 'Detroit', arrival_city: 'Orlando')
      @flight_2 = @delta.flights.create!(number: '9091', date: '5/17/2022', departure_city: 'Chicago', arrival_city: 'Kansas City')
      @flight_3 = @jetblue.flights.create!(number: '6798', date: '10/9/2022', departure_city: 'Tulsa', arrival_city: 'Fresno')
      @flight_4 = @southwest.flights.create!(number: '9665', date: '11/22/2022', departure_city: 'Durham', arrival_city: 'New Orleans')

      @passenger_1 = Passenger.create!(name: 'Brennan Lee Mulligan', age: 13)
      @passenger_2 = Passenger.create!(name: 'Aabria Iyengar', age: 9)
      @passenger_3 = Passenger.create!(name: 'Bill Seacaster', age: 46)
      @passenger_4 = Passenger.create!(name: 'Misty Moore', age: 44)
      @passenger_5 = Passenger.create!(name: 'Kingston Brown', age: 84)

      fp_1 = FlightPassenger.create!(flight_id:"#{@flight_1.id}" , passenger_id:"#{@passenger_1.id}" )
      fp_2 = FlightPassenger.create!(flight_id:"#{@flight_1.id}" , passenger_id:"#{@passenger_2.id}" )
      fp_3 = FlightPassenger.create!(flight_id:"#{@flight_1.id}" , passenger_id:"#{@passenger_3.id}" )
      fp_4 = FlightPassenger.create!(flight_id:"#{@flight_1.id}" , passenger_id:"#{@passenger_4.id}" )
      fp_5 = FlightPassenger.create!(flight_id:"#{@flight_1.id}" , passenger_id:"#{@passenger_5.id}" )

    
    expect(@american.adult_passengers).to eq([@passenger_3, @passenger_4, @passenger_5])
  end
  end
end