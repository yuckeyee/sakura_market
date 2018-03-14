# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  method     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Payment < ApplicationRecord
end
