class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :product_type
      t.integer :quantity
      t.integer :retail_price
      t.string :sku
      t.references :category, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.timestamps
    end
  end
end