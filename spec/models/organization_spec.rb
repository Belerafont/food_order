require 'rails_helper'

describe Organization, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:organization)).to be_valid
    end

    it { should validate_presence_of(:name) }
  end
end