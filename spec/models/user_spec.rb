require 'rails_helper'

describe User, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:user)).to be_valid
    end
  end

  it 'should first user only admin' do
    organization = create(:organization)
    user = build(:user, organization: organization)
    expect(user.save).to eq(true)
    expect(user.admin?).to eq(true)
    user_second = build(:user, email: 'John@example.com', organization: organization)
    expect(user_second.save).to eq(true)
    expect(user_second.admin?).to eq(false)
  end

  it { should validate_presence_of(:name) }
  it { should belong_to(:organization) }

end
