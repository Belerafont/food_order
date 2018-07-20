class Admin::AppController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  protected
  def authorize_admin
    redirect_to root_path, status: 401 unless current_user.admin?
  end
end