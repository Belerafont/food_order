class AddTokensToUSer < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :public_key, :string
    add_column :users, :secret_key, :string
  end
end
