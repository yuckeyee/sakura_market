class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :image
      t.integer :price
      t.text :description
      t.boolean :visibility, default: false, null: false
      t.integer :order

      t.timestamps
    end
  end
end
