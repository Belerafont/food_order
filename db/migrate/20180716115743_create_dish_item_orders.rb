class CreateDishItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_item_orders do |t|
      t.belongs_to :dish_item
      t.belongs_to :order
    end
  end
end
