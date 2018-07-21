module DishItemsHelper
  def dish_items_options_for_select
    options_for_select([DishItems::First, DishItems::Main, DishItems::Drink].map { |kind|
      [kind.to_s.remove('DishItems::'), kind] })
  end
end