FactoryBot.define do
  factory :search do
    sequence(:query) { |n| "query#{n}" }
    min_price 100
    max_price 500
    user
  end
end
