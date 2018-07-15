class DishItems::Base < ApplicationRecord
  self.table_name = "dish_items"
  has_and_belongs_to_many :menus
end
