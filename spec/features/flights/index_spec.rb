require 'rails_helper'
# save_and_open_page

RSpec.describe 'Flights index page', type: :model do

  before(:each) do
    @united = Airline.create!(name: "Wind United")
    @spirit = Airline.create!(name: "Spirit of Freedom")
    @flight1 = @united.flights.create!(number: 879, date: Date.today, departure_city: "Miami", arrival_city: "Portland")
    @flight2 = @united.flights.create!(number: 564, date: Date.today, departure_city: "Fort Myers", arrival_city: "Syracuse")
    @flight3 = @united.flights.create!(number: 231, date: Date.today, departure_city: "Port Charlotte", arrival_city: "Boston")
    @flight4 = @spirit.flights.create!(number: 693, date: Date.today, departure_city: "Tampa", arrival_city: "Denver")
  end

  it 'has a list of all flight numbers' do
    visit "/flights"
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)
    expect(page).to have_content(@flight4.number)
  end

  it 'has the airline listed beside the flight number' do
    visit "/flights"
    expect(page).to have_content(@spirit.name)
    expect(page).to have_content(@united.name)
    expect(page).to have_content("693- Spirit of Freedom")
    expect(page).to have_content("879- Wind United")
  end
end
