class DishItemMenu < ApplicationRecord
  belongs_to :dish_item, class_name: 'DishItems::Base'
  belongs_to :menu
end