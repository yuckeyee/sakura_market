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
      sum += cart_item.item.price * cart_item.quantity
    end
    sum
  end

  # ここの書き方はなんかすっきりしない
  def self.get_delivery_cash(cart_items)
    sum = self.sum_price(cart_items)
    case sum
    when 0..9999
      300
    when 10000...29999
      400
    when 30000...99999
      600
    else
      1000
    end
  end

  def self.get_postage(cart_items)
    1 if cart_items.count < 5
    if cart_items.count % 5 == 0
      times = cart_items.count.div(5)
    else
      times = cart_items.count.div(5) + 1
    end
    times * 600
  end
end
