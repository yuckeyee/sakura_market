class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :method, null: false

      t.timestamps
    end
  end
end
