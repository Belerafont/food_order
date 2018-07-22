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
    order = current_user.orders.build(order_params)
    if order.save
      redirect_to menus_path, notice: 'Order successfully created'
    else
      render 'new', alert: order.errors.full_messages
    end
  end

  private
  def order_params
    params.require(:order).permit(dish_item_orders_attributes: [:dish_item_id])
  end
end