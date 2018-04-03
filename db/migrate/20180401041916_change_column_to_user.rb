class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :role, :integer, null: false, default: 0
  end

  def down
    change_column :users, :role, :integer, null: false
  end
end
