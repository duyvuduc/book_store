class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.integer :total
      t.string :phone_number
      t.string :email
      t.string :customer_name
      t.text :description

      t.timestamps
    end
  end
end
