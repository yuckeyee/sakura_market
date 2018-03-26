FactoryBot.define do
  factory :user do
    name "RubyRails"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password "dottle-nouveau-pavilion-tights-furze"
    role 0
  end
end
