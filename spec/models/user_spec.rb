require 'rails_helper'

RSpec.describe User do
  let(:user) { FactoryBot.build(:user) }

  it 'must be valid' do
    expect(user).to be_valid
  end

  describe 'email' do
    it 'must be present' do
      user.email = ''
      expect(user).not_to be_valid
    end

    it "mustn't be longer than 105 signs" do
      user.email = 'a' * 100 + '@example.com'
      expect(user).not_to be_valid
    end


    it 'must be in right format' do
      user.email = 'email@at.'
      expect(user).not_to be_valid
      user.email = 'email@at'
      expect(user).not_to be_valid
      user.email = 'email@.s'
      expect(user).not_to be_valid
      user.email = '#@example.com'
      expect(user).not_to be_valid
      user.email = '@example.com'
      expect(user).not_to be_valid
      user.email = 'świr@example.com'
      expect(user).not_to be_valid
      user.email = 'example.com'
      expect(user).not_to be_valid
      user.email = 'example.at.example.com'
      expect(user).not_to be_valid
      user.email = 'jan.kowalski@example.com'
      expect(user).to be_valid
    end
  end

  describe 'password' do
    it 'must be present' do
      user.password = ''
      expect(user).not_to be_valid
    end

    it 'must be longer than 6 characters' do
      user.password = '12345'
      expect(user).not_to be_valid
      user.password = '123456'
      expect(user).to be_valid
    end
  end
end
