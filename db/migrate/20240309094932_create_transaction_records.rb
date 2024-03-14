class CreateTransactionRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :transaction_records do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :employee
      t.string :references
      t.string :transaction_date

      t.timestamps
    end
  end
end
