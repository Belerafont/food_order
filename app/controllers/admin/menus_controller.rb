class Admin::MenusController < Admin::AppController

  def new
    @menu = Menu.find_by(date: Date.today)
    @menu ||= Menu.new
  end

  def create
    menu = Menu.create!
    add_record_to_menu(menu, menu_params[:dish_item_ids])
    redirect_to menus_path
  end

  def update
    menu = Menu.find(params[:id])
    menu.dish_item_menus.destroy_all
    add_record_to_menu(menu, menu_params[:dish_item_ids])
    redirect_to menus_path
  end

  private

  def add_record_to_menu(menu, item_array)
    item_array.each do |id|
      di = DishItems::Base.find(id)
      menu.dish_items << di
    end
  end

  def menu_params
    params.permit(dish_item_ids:[])
  end
end