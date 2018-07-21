class Api::MenusController < Api::AppController

  def index
    render json: Menu.weekdays
  end
end