class DishItemOrder < ApplicationRecord
  belongs_to :dish_item, class_name: 'DishItems::Base'
  belongs_to :order
end