class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :role
      t.string :phone_number
      t.string :business_name
      t.string :password_digest

      t.timestamps
    end
  end
end
