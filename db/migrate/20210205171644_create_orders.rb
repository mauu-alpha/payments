class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :status, index: true

      t.timestamps null: false
    end
  end
end
