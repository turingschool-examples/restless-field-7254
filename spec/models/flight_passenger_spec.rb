require 'rails_helper'

  RSpec.describe FlightPassenger, type: :model do
  describe "relationships" do
    it { should belong_to :flights}
    it { should belong_to :passengers}
  end
end
