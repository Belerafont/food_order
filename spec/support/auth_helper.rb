module AuthHelper
  def http_login(login, pass)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(login, pass)
  end
end

RSpec.configure do |config|
  config.include AuthHelper, type: :controller
end