# == Schema Information
#
# Table name: ship_times
#
#  id         :integer          not null, primary key
#  timezone   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShipTime < ApplicationRecord
  has_many :orders
end
