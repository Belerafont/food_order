require 'rails_helper'
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
end

describe "Users", type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user) }
  it "post new users" do
    post user_registration_path,
    params: {
      name: 'Bob', email: 'bob22@example.com', password: '123456',
      password_confirmation: '123456'
    }
    expect(response).to have_http_status(200)
  end

  it 'new user session' do
    post user_session_path,
      params: {
        email: 'Colin@example.com', password: '123456'
      }
    expect(response).to have_http_status(200)
  end

  it 'new user session with wrong params' do
    post user_session_path,
      params: {
        email: 'Colin@example.com', password: '222222'
      }
    expect(response).to have_http_status(200)
  end
end