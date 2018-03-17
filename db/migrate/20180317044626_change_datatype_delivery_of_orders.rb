class ChangeDatatypeDeliveryOfOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :delivery, :date
  end
end
