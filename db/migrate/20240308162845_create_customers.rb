class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :username
      t.integer :credit_limit
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
