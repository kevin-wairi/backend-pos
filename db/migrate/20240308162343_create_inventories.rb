class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.integer :quantity
      t.string :restock_level

      t.timestamps
    end
  end
end
