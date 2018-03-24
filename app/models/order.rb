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
    today = Date.today
    dates = []
    n = 1

    # todayを平日にするまで繰り返す
    while !self.workday?(today)
      today = today.next_day(1)
    end
    dates << today
    while true do
      next_day = today.next_day(n)
      dates << next_day if self.workday?(next_day)
      n += 1
      break if dates.size == 14
    end
    dates.slice!(0..1)
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
