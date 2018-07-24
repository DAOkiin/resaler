FactoryBot.define do
  factory :item do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:product_id) { |n| "product_#{n}" }
    url 'url'
    source 'youla'
    search
  end
end
