class MenusController < ApplicationController
  before_action :authenticate_user!
  def index
    @menus = Menu.weekdays
  end
end