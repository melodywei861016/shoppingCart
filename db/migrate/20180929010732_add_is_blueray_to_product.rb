class AddIsBluerayToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :isBlueray, :boolean, null: false
  end
end
