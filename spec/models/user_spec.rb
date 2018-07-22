require 'rails_helper'

describe User, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:user)).to be_valid
    end
  end

  it 'should first user only admin' do
    user = build(:user, role: nil)
    expect(user.save).to eq(true)
    expect(user.admin?).to eq(true)

    user_second = build(:user, email: 'John@example.com')
    expect(user_second.save).to eq(true)
    expect(user_second.admin?).to eq(false)
  end

  it { should validate_presence_of(:name) }

  shared_examples 'has_secure_token' do |attr|
    let(:user) { build(:user) }

    it 'should be generated' do
      expect(user[attr]).to be_nil
      expect(user.save).to eql(true)
      expect(user[attr]).to_not be_empty
    end
  end

  context 'public_key' do
    include_examples 'has_secure_token', :public_key
  end

  context 'secret_key' do
    include_examples 'has_secure_token', :secret_key
  end
end
