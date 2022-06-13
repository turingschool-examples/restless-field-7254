require 'rails_helper'

RSpec.describe PassengerFlight do
  describe 'relationships' do
    it { should belong_to :flight }
    it { should belong_to :passenger }
  end
end
