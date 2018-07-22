class Admin::AppController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  protected
  def authorize_admin
    if current_user && !current_user.admin?
      redirect_to root_path, alert: 'You don\'t have permission to access'
    end
  end
end