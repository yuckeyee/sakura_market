FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    price 100
  end
end
