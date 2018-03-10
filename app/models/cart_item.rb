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
end
