class AddPriceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :decimal, precision: 15, scale: 2
  end
end
