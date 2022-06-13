require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  it { should belong_to(:flight) }
  it { should belong_to(:passenger) }
  it { should have_many(:airlines).through(:flight) }
end
