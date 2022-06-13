# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airline1 = Airline.create(name: "Delta")
airline2 = Airline.create(name: "American")
flight1 = airline1.flights.create(number: 1427, date: "19 November 2022", departure_city: "Albuquerque", arrival_city: "Denver")
flight2 = airline1.flights.create(number: 1276, date: "20 November 2022", departure_city: "San Diego", arrival_city: "Washington D.C")
flight3 = airline2.flights.create(number: 1742, date: "21 November 2022", departure_city: "San Francisco", arrival_city: "Skypeia")
passenger1 = flight1.passengers.create(name: "Joe", age: 25)
passenger2 = flight1.passengers.create(name: "Eliza", age: 21)
passenger3 = flight2.passengers.create(name: "Dunkin", age: 35)
passenger4 = flight3.passengers.create(name: "Albert", age: 52)
