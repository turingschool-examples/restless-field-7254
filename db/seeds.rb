# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FlightPassenger.destroy_all
Passenger.destroy_all
Flight.destroy_all
Airline.destroy_all

passenger1 = Passenger.create(name: "Brennan Lee Mulligan", age: 13)
passenger2 = Passenger.create(name: "Aabria Iyengar", age: 9)
passenger3 = Passenger.create(name: "Bill Seacaster", age: 46)
passenger4 = Passenger.create(name: "Misty Moore", age: 44)
passenger5 = Passenger.create(name: "Kingston Brown", age: 84)

american = Airline.create(name: "American")
delta = Airline.create(name: "Delta")
jetblue = Airline.create(name: "JetBlue")
southwest = Airline.create(name: "Southwest")
united = Airline.create(name: "United")

flight1 = Flight.create(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline: american)
flight2 = Flight.create(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline: delta)
flight3 = Flight.create(number: "9091", date:  "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline: jetblue)
flight4 = Flight.create(number: "6798", date:  "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline: southwest)
flight5 = Flight.create(number: "9665", date:  "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline: united)

flight_passenger1 = FlightPassenger.create(flight: flight1, passenger: passenger1)
flight_passenger2 = FlightPassenger.create(flight: flight2, passenger: passenger2)
flight_passenger3 = FlightPassenger.create(flight: flight3, passenger: passenger3)
flight_passenger4 = FlightPassenger.create(flight: flight4, passenger: passenger4)
flight_passenger5 = FlightPassenger.create(flight: flight5, passenger: passenger5)
flight_passenger6 = FlightPassenger.create(flight: flight1, passenger: passenger2)
flight_passenger7 = FlightPassenger.create(flight: flight2, passenger: passenger3)
flight_passenger8 = FlightPassenger.create(flight: flight3, passenger: passenger4)
flight_passenger9 = FlightPassenger.create(flight: flight4, passenger: passenger5)
flight_passenger10 = FlightPassenger.create(flight: flight5, passenger: passenger1)
flight_passenger11 = FlightPassenger.create(flight: flight1, passenger: passenger3)
flight_passenger12 = FlightPassenger.create(flight: flight2, passenger: passenger4)
flight_passenger13 = FlightPassenger.create(flight: flight3, passenger: passenger5)
flight_passenger14 = FlightPassenger.create(flight: flight4, passenger: passenger1)
flight_passenger15 = FlightPassenger.create(flight: flight5, passenger: passenger2)
flight_passenger16 = FlightPassenger.create(flight: flight1, passenger: passenger4)
flight_passenger17 = FlightPassenger.create(flight: flight2, passenger: passenger5)
flight_passenger18 = FlightPassenger.create(flight: flight3, passenger: passenger1)
flight_passenger19 = FlightPassenger.create(flight: flight4, passenger: passenger2)
flight_passenger20 = FlightPassenger.create(flight: flight5, passenger: passenger3)
