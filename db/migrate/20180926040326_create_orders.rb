class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :totalPrice, null: false

      t.timestamps
    end
  end
end
