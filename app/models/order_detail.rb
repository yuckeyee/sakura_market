# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  quantity   :integer          default(0), not null
#  subtotal   :integer
#  item_id    :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
end
