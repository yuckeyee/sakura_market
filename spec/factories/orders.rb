FactoryBot.define do
  factory :order do
    total 100
    postage 100
    delivery '2018-03-29'
    association :user, factory: :user
    association :payment, factory: :payment
    association :ship_time, factory: :ship_time
    # user { FactoryBot.create :user }
    # payment { FactoryBot.create :payment }
    # ship_time { FactoryBot.create :ship_time }
  end
end