class RemoveTotalPriceFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :totalPrice, :integer
  end
end
