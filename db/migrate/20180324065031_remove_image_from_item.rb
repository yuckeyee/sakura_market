class RemoveImageFromItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :image, :text
  end
end
