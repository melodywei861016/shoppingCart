class RemovePriceFromOrderItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :price, :integer
  end
end
