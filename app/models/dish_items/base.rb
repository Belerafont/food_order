class DishItems::Base < ApplicationRecord
  self.table_name = "dish_items"
  has_many :dish_item_menus, foreign_key: 'dish_item_id'
  has_many :menus, through: :dish_item_menus

  has_many :dish_item_orders, foreign_key: 'dish_item_id'
  has_many :orders, through: :dish_item_orders

  validates :name, :price, presence: true

  mount_uploader :image, ItemImageUploader

  def self.kinds
    [DishItems::First, DishItems::Main, DishItems::Drink]
  end
end
