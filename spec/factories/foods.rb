FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    type { "Boiled" }
    default_price { Faker::Number.positive }
    status { true }
    average_star { Faker::Number.between(from: 1, to: 10) }
    description { Faker::Food.description }
  end
end
