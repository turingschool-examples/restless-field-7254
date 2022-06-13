require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
    it {should validate_presence_of :airline_id}
  end

  describe 'instance methods' do
    it "returns the airline name that the flight belongs to" do
      airline1 = Airline.create!(name: "JetBlue")
      airline2 = Airline.create!(name: "Hawaiian")

      flight1 = airline1.flights.create!(number: 1, date: "5/19/22", arrival_city: "NYC", departure_city: "San Fran")
      flight2 = airline2.flights.create!(number: 2, date: "5/23/22", arrival_city: "Honolulu", departure_city: "Denver")

      expect(flight1.airline_name).to eq("JetBlue")
      expect(flight2.airline_name).to eq("Hawaiian")
    end
  end

end
