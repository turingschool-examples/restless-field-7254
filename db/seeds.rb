# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
air1 = Airline.create!(name: "Big Sky")
fly1 = air1.flights.create!(number: "177", date: "06/16/22", arrival_city: "Boston", departure_city: "Denver")
fly2 = air1.flights.create!(number: "208", date: "06/16/22", arrival_city: "Geneva", departure_city: "Houston")

air2 = Airline.create!(name: "Denta")
fly3 = air2.flights.create!(number: "444", date: "06/16/22", arrival_city: "Langston", departure_city: "Tampa")
fly4 = air2.flights.create!(number: "101", date: "06/16/22", arrival_city: "Tampa", departure_city: "Santa Fe")

sally = Passenger.create!(name: "Sally", age: 20, status: true)
sam = Passenger.create!(name: "Sam", age: 10, status: true)
scott = Passenger.create!(name: "Scott", age: 18, status: true)
susan = Passenger.create!(name: "Susan", age: 43, status: true)
luke = Passenger.create!(name: "Luke", age: 31, status: true)
liam = Passenger.create!(name: "Liam", age: 2, status: true)
lindsey = Passenger.create!(name: "Lindsey", age: 40, status: true)
laura = Passenger.create!(name: "Laura", age: 40, status: true)

flypass1 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sally.id)
flypass2 = FlightPassenger.create!(flight_id: fly1.id, passenger_id: sam.id)
flypass3 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: scott.id)
flypass4 = FlightPassenger.create!(flight_id: fly2.id, passenger_id: susan.id)
flypass5 = FlightPassenger.create!(flight_id: fly3.id, passenger_id: luke.id)
flypass6 = FlightPassenger.create!(flight_id: fly3.id, passenger_id: liam.id)
flypass7 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: lindsey.id)
flypass8 = FlightPassenger.create!(flight_id: fly4.id, passenger_id: laura.id)
