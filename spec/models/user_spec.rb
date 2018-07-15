require 'rails_helper'

describe User, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:user)).to be_valid
    end
  end

  it 'should first user only admin' do
    user = build(:user)
    expect(user.save).to eq(true)
    expect(user.admin?).to eq(true)

    user_second = build(:user, email: 'John@example.com')
    expect(user_second.save).to eq(true)
    expect(user_second.admin?).to eq(false)
  end

  it { should validate_presence_of(:name) }

end
