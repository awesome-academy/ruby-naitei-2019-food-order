FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    type { "Boiled" }
    default_price { Faker::Number.positive }
    status { true }
    average_star { 5.2 }
    description { Faker::Food.description }
  end
end
