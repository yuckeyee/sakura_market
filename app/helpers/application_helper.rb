module ApplicationHelper
  # 3営業日の配列を取得する
  def get_workdays
    dates = []
    n = 3
    today = nil
    while true do
      if today
        next_day = today.next_day(n)
        dates << next_day if workday?(next_day)
      else
        today = Date.today
        dates << today if workday?(today)
      end
      n += 1
      break if dates.size == 12
    end
    dates
  end

  def workday?(date)
    if HolidayJp.holiday?(date) || date.sunday? || date.saturday?
      false
    else
      true
    end
  end
end
