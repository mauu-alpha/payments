class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.numeric :amount
      t.string :payment_method
      t.string :status
      t.references :order, index: true

      t.timestamps null: false
    end
  end
end
