FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.name }
    average_star { 5.0 }
    selected_count { 5 }
    address { Faker::Address.full_address }
  end
end
