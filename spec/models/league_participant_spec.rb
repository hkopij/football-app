require 'rails_helper'

RSpec.describe LeagueParticipant do
  let(:league_participant) { FactoryBot.build(:league_participant) }

  it 'must be valid' do
    expect(league_participant).to be_valid
  end

  describe 'teamname' do
    it 'must be present' do
      league_participant.teamname = ''
      expect(league_participant).to_not be_valid
    end
  end

  describe 'position' do
    it 'must be present' do
      league_participant.position = ''
      expect(league_participant).to_not be_valid
    end
  end

  describe 'goals_scored' do
    it 'must be present' do
      league_participant.goals_scored = ''
      expect(league_participant).to_not be_valid
    end
  end

  describe 'goals_lost' do
    it 'must be present' do
      league_participant.goals_lost = ''
      expect(league_participant).to_not be_valid
    end
  end

  describe 'points' do
    it 'must be present' do
      league_participant.points = ''
      expect(league_participant).to_not be_valid
    end
  end
end
