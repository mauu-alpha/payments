class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.integer :quantity
      t.numeric :unit_price

      t.timestamps null: false
    end
  end
end
