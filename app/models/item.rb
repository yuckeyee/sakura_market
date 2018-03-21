# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  image       :text(65535)
#  price       :integer
#  description :text(65535)
#  visibility  :boolean          default(FALSE), not null
#  order       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  has_many :order_details
end
