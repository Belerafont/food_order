module CapybaraSpecHelper
  def login(user)
    visit '/users/sign_in'

    expect(page).to have_content('Log in')
    expect(page).to have_content('Remember me')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: '123456'

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content(user.name)
  end
end

RSpec.configure do |config|
  config.include CapybaraSpecHelper, type: :feature
end