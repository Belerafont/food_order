require 'rails_helper'

describe 'Admin menus new', type: :feature do
  let!(:admin) { create(:user, :admin) }
  let!(:user) { create(:user) }
  let(:menu) { create(:menu) }

  it 'should user has no access /admin/menus/new' do
    login(user)

    visit '/admin/menus/new'

    expect(page).to have_current_path('/')
    expect(page).to have_content("You don't have permission to access")
  end

  it 'should admin can see new menu and see add dish item' do
    login(admin)

    visit '/admin/menus/new'

    expect(page).to have_current_path('/admin/menus/new')
    expect(page).to have_button('Create')
    expect(page).to have_link('Add Dish Item')
  end

  it 'should admin create new menu' do
    login(admin)
    visit '/admin/menus/new'
    expect(page).to have_current_path('/admin/menus/new')

    all('input[type=checkbox]').each do |checkbox|
      checkbox.click
    end

    click_button 'Create'

    expect(page).to have_current_path('/menus')
    expect(page).to have_content("Menu successfully created")
  end

end