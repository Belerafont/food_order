class Admin::OrdersController < Admin::AppController
  def index
    @orders = Order.weekdays
  end
end