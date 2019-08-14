FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.sentence }
  end
end
