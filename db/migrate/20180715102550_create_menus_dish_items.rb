class CreateMenusDishItems < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_item_menus do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :dish_item, index: true
    end
  end
end
