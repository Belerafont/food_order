class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @menu = Menu.find_by(date: params[:format])
    @order = Order.new
    3.times do
      @order.dish_item_orders.build
    end
  end

  def create
    current_user.orders.create(order_params)
    redirect_to menus_path
  end

  private
  def order_params
    params.require(:order).permit(dish_item_orders_attributes: [:dish_item_id])
  end
end