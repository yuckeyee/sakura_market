FactoryBot.define do
  factory :cart_item do
    sequence(:item_id) { |n| n }
    sequence(:quantity) { |n| n }
  end
end
