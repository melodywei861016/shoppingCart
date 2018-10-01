class AddTotalPriceToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :totalPrice, :decimal, precision: 15, scale: 2
  end
end
