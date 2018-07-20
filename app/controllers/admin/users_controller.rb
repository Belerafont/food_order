class Admin::UsersController < Admin::AppController
  def index
    @users = User.client
  end
end