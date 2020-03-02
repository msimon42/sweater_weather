require 'rails_helper'

RSpec.describe Munchie do
  describe 'instance_methods' do
    it 'returns attributes correctly' do
      munchie = Munchie.new('denver,co', 'pueblo,co', 'chinese')

      expect(munchie.end_location).to eq('Pueblo, CO, USA')
      expect(munchie.travel_time).to eq('1 hour 48 mins')
      expect(munchie.forecast).to eq('Clear')
      expect(munchie.restaurant).to eq({name: "Kan's Kitchen", address: "1620 S Prairie AvePueblo, CO 81005"})
    end
  end
end
