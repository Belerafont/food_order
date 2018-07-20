class Menu < ApplicationRecord
  has_many :dish_item_menus
  has_many :dish_items, through: :dish_item_menus, class_name: 'DishItems::Base'

  before_validation :get_date

  accepts_nested_attributes_for :dish_item_menus

  scope :weekdays, -> { where('created_at >= ?', 1.week.ago) }

  def get_date
    self.date = DateTime.now.to_date
  end
end
