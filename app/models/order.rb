class Order < ApplicationRecord
  belongs_to :user

  has_many :dish_item_orders
  has_many :dish_items, through: :dish_item_orders, class_name: 'DishItems::Base'

  accepts_nested_attributes_for :dish_item_orders

end
