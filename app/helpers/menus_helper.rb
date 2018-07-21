module MenusHelper
  def menu_new?(menu)
    menu.dish_items.count > 0 ? admin_menu_path(menu) : admin_menus_path
  end

  def get_name_menu_dish_item(index)
    DishItems::Base.kinds[index].first.class.name.remove('DishItems::')
  end

  def cheking_dish_item_in_menus(menu, item)
    menu.dish_item_menus.map(&:dish_item_id).include?(item.id)
  end
end