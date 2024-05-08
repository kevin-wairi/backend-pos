class CreateJoinTableSupplierInventory < ActiveRecord::Migration[7.1]
  def change
    create_join_table :suppliers, :inventories do |t|
      t.index [:supplier_id, :inventory_id]
      t.index [:inventory_id, :supplier_id]
    end
  end
end
