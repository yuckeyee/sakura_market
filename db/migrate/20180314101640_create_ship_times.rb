class CreateShipTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :ship_times do |t|
      t.string :timezone, null: false

      t.timestamps
    end
  end
end
