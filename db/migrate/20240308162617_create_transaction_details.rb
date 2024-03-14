class CreateTransactionDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :transaction_details do |t|
      t.references :transaction_record, null: false, foreign_key: true
      t.references :inventory, null: false, foreign_key: true
      t.string :payment_mode
      t.integer :quantity_sold

      t.timestamps
    end
  end
end
