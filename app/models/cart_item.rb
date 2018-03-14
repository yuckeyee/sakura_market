# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  quantity   :integer          default(0), not null
#  item_id    :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def self.sum_price(cart_items)
    sum = 0
    cart_items.each do |cart_item|
      sum += cart_item.item.price
    end
    sum
  end
end
