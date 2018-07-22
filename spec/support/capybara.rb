Capybara.javascript_driver = :selenium_chrome

RSpec.configure do |config|
  config.after(:each) do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end