require 'rails_helper'

describe 'Admin orders', type: :feature do
  let!(:admin) { create(:user, :admin) }
  let!(:user) { create(:user) }
  let!(:order) { create(:order) }

  it 'should user has no access /admin/orders' do
    login(user)

    visit '/admin/orders'

    expect(page).to have_current_path('/')
    expect(page).to have_content("You don't have permission to access")
  end

  it 'should admin can browse days and see users orders' do
    login(admin)

    visit '/admin/orders'

    expect(page).to have_current_path('/admin/orders')
    expect(page).to have_content('Amount per day: 35')
  end
end