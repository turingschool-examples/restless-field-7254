require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it { should have_many :flights }
  end

  describe "validations" do
    it { should define_enum_for(:status).with_values(["added", "removed"]) }
  end
end
