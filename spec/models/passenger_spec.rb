require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { should have_many :flights }
  # it { should have_many(:airlines).through(:flights)}
end
