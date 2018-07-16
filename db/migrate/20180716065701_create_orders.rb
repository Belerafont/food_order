class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.integer :price
      t.string :first
      t.string :main
      t.string :drink

      t.timestamps
    end
  end
end
