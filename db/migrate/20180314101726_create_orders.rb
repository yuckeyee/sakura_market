class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :total, default: 0, null: false
      t.integer :postage, default: 0, null: false
      t.datetime :delivery
      t.references :user, foreign_key: true
      t.references :payment, foreign_key: true
      t.references :ship_time, foreign_key: true

      t.timestamps
    end
  end
end
