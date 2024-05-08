class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end

