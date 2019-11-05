require 'rails_helper'

RSpec.describe League do
  let(:league) { FactoryBot.build(:league) }

  it 'must be valid' do
    expect(league).to be_valid
  end

  describe 'name' do
    it 'must be present' do
      league.name = ''
      expect(league).to_not be_valid
    end
  end

  describe 'country' do
    it 'must be present' do
      league.country = ''
      expect(league).to_not be_valid
    end
  end

  describe 'api_league_id' do
    it 'must be present' do
      league.api_league_id = ''
      expect(league).to_not be_valid
    end
  end
end
