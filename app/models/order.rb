# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  total        :integer          default(0), not null
#  postage      :integer          default(0), not null
#  delivery     :datetime
#  user_id      :integer
#  payment_id   :integer
#  ship_time_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :ship_time
end
