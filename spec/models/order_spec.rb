require 'rails_helper'
require 'date'

RSpec.describe Order, type: :model do
  describe '.get_workdays' do
    context '今日が平日の時' do
      it '休日を除外し3営業日から14営業日までの日付を取得すること(3営業日が休日を挟む）' do
        Timecop.freeze(Time.new(2018, 3, 23, 12, 0, 0))
        expect(Order.get_workdays).to match [
          Date.parse("2018/03/27"),
          Date.parse("2018/03/28"),
          Date.parse("2018/03/29"),
          Date.parse("2018/03/30"),
          Date.parse("2018/04/02"),
          Date.parse("2018/04/03"),
          Date.parse("2018/04/04"),
          Date.parse("2018/04/05"),
          Date.parse("2018/04/06"),
          Date.parse("2018/04/09"),
          Date.parse("2018/04/10"),
          Date.parse("2018/04/11")
        ]
      end
      it '休日を除外し3営業日から14営業日までの日付を取得すること(3営業日が休日を挟まない）' do
        Timecop.freeze(Time.new(2018, 3, 26, 12, 0, 0))
        expect(Order.get_workdays).to match [
          Date.parse("2018/03/28"),
          Date.parse("2018/03/29"),
          Date.parse("2018/03/30"),
          Date.parse("2018/04/02"),
          Date.parse("2018/04/03"),
          Date.parse("2018/04/04"),
          Date.parse("2018/04/05"),
          Date.parse("2018/04/06"),
          Date.parse("2018/04/09"),
          Date.parse("2018/04/10"),
          Date.parse("2018/04/11"),
          Date.parse("2018/04/12")
        ]
      end
    end

    context '今日が休日のとき' do
      it '休日を除外し3営業日から14営業日までの日付を取得すること(土曜日）' do
        Timecop.freeze(Time.new(2018, 3, 24, 12, 0, 0))
        expect(Order.get_workdays).to match [
          Date.parse("2018/03/28"),
          Date.parse("2018/03/29"),
          Date.parse("2018/03/30"),
          Date.parse("2018/04/02"),
          Date.parse("2018/04/03"),
          Date.parse("2018/04/04"),
          Date.parse("2018/04/05"),
          Date.parse("2018/04/06"),
          Date.parse("2018/04/09"),
          Date.parse("2018/04/10"),
          Date.parse("2018/04/11"),
          Date.parse("2018/04/12")
        ]
      end
      it '休日を除外し3営業日から14営業日までの日付を取得すること(日曜日）' do
        Timecop.freeze(Time.new(2018, 3, 25, 12, 0, 0))
        expect(Order.get_workdays).to match [
          Date.parse("2018/03/28"),
          Date.parse("2018/03/29"),
          Date.parse("2018/03/30"),
          Date.parse("2018/04/02"),
          Date.parse("2018/04/03"),
          Date.parse("2018/04/04"),
          Date.parse("2018/04/05"),
          Date.parse("2018/04/06"),
          Date.parse("2018/04/09"),
          Date.parse("2018/04/10"),
          Date.parse("2018/04/11"),
          Date.parse("2018/04/12")
        ]
      end
    end
  end

  describe '.workday?' do
    it '平日の場合、trueを返すこと' do
      date = Date.parse("2018/03/23")
      expect(Order.workday?(date)).to be true
    end
    it '休日の場合、falseを返すこと' do
      date = Date.parse("2018/03/24")
      expect(Order.workday?(date)).to be false
    end
  end
end
