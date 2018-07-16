module OrdersHelper

  def menu_for_this_day?(menu, day)
    menu.created_at.strftime('%A') == day
  end

  def fresh_menu(menu)
    if Date.current == menu.created_at.to_date
      new_order_path
    else
      order_path(menu.id)
    end
  end

  def order_option_for_select_by_type(f, type)
    array = get_dish_items_by_type(type)
    options_for_select(array.each.map { |dish_item|
        [dish_item.name + ' ' + 'Price: ' + dish_item.price.to_s, dish_item.name] })
  end

  def get_dish_items_by_type(type)
    items = @menu.dish_items
    array = []
    items.each do |item|
      if item.type == type
        array << item
      end
    end
    array
  end
end