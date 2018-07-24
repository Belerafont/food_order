class Api::AppController < ApplicationController
  before_action :check_auth

  protected
  def check_auth
    authenticate_or_request_with_http_basic do |username,password|
      @current_user = User.find_by_public_key(username)
      @current_user && @current_user.secret_key == password
    end
  end
end