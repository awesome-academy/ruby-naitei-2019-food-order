FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.name }
    average_star { Faker::Number.between(from: 1, to: 10) }
    selected_count { Faker::Number.between(from: 1, to: 10) }
    address { Faker::Address.full_address }
  end
end
