class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @menus, @menus_days = Orders::ListService.new.call
  end

  def show
    @menu = Orders::FetchService.new(id: params[:id]).call
  rescue Errors::NotFound
    raise ActionController::RoutingError.new('Not Found')
  end

  def new
    @menu = Orders::FetchService.new(id: Menu.last.id).call
    @order = Order.new
  end

  def create
    @menu = Orders::CreateService.new(order_params, current_user).call
  rescue Errors::Validation
    render 'new', alert: 'Validation failed'
  end

  private
  def order_params
    params.require(:order).permit(:first, :main, :drink)
  end
end