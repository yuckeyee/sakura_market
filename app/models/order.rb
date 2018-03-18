# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  total        :integer          default(0), not null
#  postage      :integer          default(0), not null
#  delivery     :date
#  user_id      :integer
#  payment_id   :integer
#  ship_time_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Order < ApplicationRecord
  require 'date'
  belongs_to :user
  belongs_to :payment
  belongs_to :ship_time
  has_many :order_details
  
  # 3営業日の配列を取得する
  def self.get_workdays
    dates = []
    n = 3
    today = nil
    while true do
      if today
        next_day = today.next_day(n)
        dates << next_day if self.workday?(next_day)
      else
        today = Date.today
        dates << today if self.workday?(today)
      end
      n += 1
      break if dates.size == 12
    end
    dates
  end

  def self.workday?(date)
    if HolidayJp.holiday?(date) || date.sunday? || date.saturday?
      false
    else
      true
    end
  end
end
