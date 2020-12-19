class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :book, foreign_key: true
      t.integer :number
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
