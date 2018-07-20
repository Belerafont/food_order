module OrdersHelper

  def menu_day_name(menu)
    menu.created_at.strftime('%A')
  end

  def order_option_for_select_by_type(klass, menu)
    options_for_select(klass.joins(:dish_item_menus).where(dish_item_menus: { menu_id: menu }).map { |dish_item|
      [dish_item.name + ' Price: ' + dish_item.price.to_s, dish_item.id] })
  end
end