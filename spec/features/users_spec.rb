require 'rails_helper'

describe 'User', type: :feature do
  let!(:user) { create(:user) }

  it 'should not be able to sign in' do
    visit '/'

    expect(page).to have_content('Log in')
    expect(page).to have_content('Remember me')

    fill_in 'Email', with: 'someuser@example.com'
    fill_in 'Password', with: '123456'

    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  it 'should be able to sign in' do
    visit '/'

    expect(page).to have_content('Log in')
    expect(page).to have_content('Remember me')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: '123456'

    click_button 'Log in'

    expect(page).to have_content(user.name)
  end

  it 'should be able to sign up with name, email and password' do
    visit 'users/sign_up'

    expect(page).to have_content('Sign up')
    expect(page).to have_content('Log in')

    fill_in 'Name', with: 'Sample name'
    fill_in 'Email', with: 'example2@email.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_current_path('/')
  end

  it 'should not be able to sign up with short password' do
    visit 'users/sign_up'

    expect(page).to have_content('Sign up')
    expect(page).to have_content('Log in')

    fill_in 'Name', with: 'Sample name'
    fill_in 'Email', with: 'example2@email.com'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'

    click_button 'Sign up'

    expect(page).to have_current_path('/users')
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end

  it 'should user can see edit page' do
    login(user)
    expect(page).to have_content('Edit')

    click_link 'Edit'

    expect(page).to have_current_path('/users/edit')
    expect(page).to have_content("Password (leave blank if you don't want to change it)")
    expect(page).to have_button('Update')
  end

  it 'should user can edit your profile' do
    login(user)
    visit 'users/edit'

    fill_in 'Name', with: 'New name'
    fill_in 'Current password', with: user.password

    click_button 'Update'

    expect(page).to have_current_path('/')
    expect(page).to have_content('Your account has been updated successfully.')
  end
end