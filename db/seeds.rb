# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    @airline = Airline.create!(name: 'Frontier')
    @flight1 = Flight.create!(number: '1727', date: '08/03/20', departure_city: 'Denver',
                              arrival_city: 'Reno', airline_id: @airline.id)
    @flight2 = Flight.create!(number: '1828', date: '08/04/20', departure_city: 'Peoria',
                              arrival_city: 'Madison', airline_id: @airline.id)
    @flight3 = Flight.create!(number: '1929', date: '08/01/20', departure_city: 'Dallas',
                              arrival_city: 'Detroit', airline_id: @airline.id)
    @passenger1 = Passenger.create!(name: 'Joe', age: 20)
    @passenger2 = Passenger.create!(name: 'Mike', age: 25)
    @passenger3 = Passenger.create!(name: 'Dani', age: 24)
    @passenger4 = Passenger.create!(name: 'Richard', age: 30)
    @pf1 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @pf2 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @pf3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @pf3 = PassengerFlight.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
