require 'rails_helper'

RSpec.describe Flight, type: :feature do
  before :each do
    @spirit = Airline.create!(name: "Spirit")
    @united = Airline.create!(name: "United")
    @flight1 = spirit.flights.create!()
  end
end