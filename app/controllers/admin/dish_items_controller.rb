class Admin::DishItemsController < Admin::AppController
  def new
    @dish_item = DishItems::Base.new
  end

  def create
    DishItems::Base.create(dish_item_params)
    redirect_to new_admin_menu_path
  end

  private
  def dish_item_params
    params.require(:dish_items_base).permit(:name, :price, :type)
  end
end