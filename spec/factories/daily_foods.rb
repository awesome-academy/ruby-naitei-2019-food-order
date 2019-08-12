FactoryBot.define do
  factory :daily_food do
    price { Faker::Number.positive }
    review { Faker::Lorem.sentence }
    star { Faker::Number.between(from: 1, to: 10) }
  end
end
