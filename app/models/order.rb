class Order < ApplicationRecord
  belongs_to :user

  has_many :dish_item_orders
  has_many :dish_items, through: :dish_item_orders, class_name: 'DishItems::Base'

  accepts_nested_attributes_for :dish_item_orders

  scope :weekdays, -> { where('created_at >= ?', 1.week.ago) }

  before_validation :get_date

  def get_date
    self.date = DateTime.now.to_date
  end

end
