class Menu < ApplicationRecord
  has_many :dish_item_menus
  has_many :dish_items, through: :dish_item_menus, class_name: 'DishItems::Base'

  before_validation :get_date

  accepts_nested_attributes_for :dish_item_menus

  scope :weekdays, -> { where('created_at >= ?', 1.week.ago) }

  def get_date
    self.date = DateTime.now.to_date
  end

  def insert_dish_items!(list)
    source_ids = dish_items.pluck(:id)

    transaction do
      add_dish_item_ids!(list - source_ids)
      dish_item_menus.where(dish_item_id: source_ids - list).destroy_all
    end
  end

  protected
  def add_dish_item_ids!(item_ids)
    item_ids.each do |item|
      dish_item_menus.create!(dish_item_id: item)
    end
  end
end
