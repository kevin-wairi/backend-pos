class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.integer :retail_price
      t.integer :wholesale_price
      t.string :restock_level
      t.string :restock_quantity
      t.boolean :status
      t.references :supplier, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

