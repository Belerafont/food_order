class Menu < ApplicationRecord
  has_and_belongs_to_many :dish_items, class_name: 'DishItems::Base'
end
