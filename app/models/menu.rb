class Menu < ApplicationRecord
  has_many :dish_item_menus
  has_many :dish_items, through: :dish_item_menus, class_name: 'DishItems::Base'
end
