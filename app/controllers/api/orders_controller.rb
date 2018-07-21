class Api::OrdersController < Api::AppController

  def create
    order = current_user.orders.build(order_params)
    if order.save
      render json: order
    else
      render json: {errors: order.errors.full_messages}
    end
  end

  private
  def order_params
    params.require(:order).permit(dish_item_orders_attributes: [:dish_item_id])
  end

end