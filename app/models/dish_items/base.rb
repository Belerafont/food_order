class DishItems::Base < ApplicationRecord
  self.table_name = "dish_items"
  has_many :dish_item_menus, foreign_key: 'dish_item_id'
  has_many :menus, through: :dish_item_menus

  validates :name, :price, presence: true
end
