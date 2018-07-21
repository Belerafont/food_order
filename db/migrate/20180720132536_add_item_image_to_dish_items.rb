class AddItemImageToDishItems < ActiveRecord::Migration[5.2]
  def change
    add_column :dish_items, :image, :string
  end
end
