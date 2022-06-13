require 'rails_helper'

RSpec.describe 'Flights index page', type: :model do

  before(:each) do
    @united = Airline.create!(name: "Wind United")
    @flight1 = @united.flights.create!(number: 879, date: Date.today, departure_city: "Miami", arrival_city: "Portland")
    @flight2 = @united.flights.create!(number: 564, date: Date.today, departure_city: "Fort Myers", arrival_city: "Syracuse")
    @flight3 = @united.flights.create!(number: 231, date: Date.today, departure_city: "Port Charlotte", arrival_city: "Boston")
    @flight4 = @united.flights.create!(number: 693, date: Date.today, departure_city: "Tampa", arrival_city: "Denver")
  end

  it 'has a list of all flight numbers' do
    visit "/flights"
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@flight4.number)
  end
end
