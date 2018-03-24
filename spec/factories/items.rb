FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    sequence(:price) { |n| n * 100 }
  end
end
