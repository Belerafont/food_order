require 'rails_helper'

describe 'Admin users', type: :feature do
  let!(:admin) { create(:user, :admin) }
  let!(:user) { create(:user) }

  it 'should be able to sign in as administrator' do
    login(admin)

    visit '/admin/users'

    expect(page).to have_current_path('/admin/users')
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end

  it 'should not be able to sign in as client' do
    login(user)

    visit '/admin/users'

    expect(page).to have_current_path('/')
    expect(page).to have_content("You don't have permission to access")
  end
end