class AddPriceToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :price, :decimal, precision: 15, scale: 2
  end
end
