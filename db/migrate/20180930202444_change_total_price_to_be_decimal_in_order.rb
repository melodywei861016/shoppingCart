class ChangeTotalPriceTypeInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :totalPrice, :decimal
  end
end
