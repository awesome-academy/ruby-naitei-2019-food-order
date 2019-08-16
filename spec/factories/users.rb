FactoryBot.define do
  factory :user do
    email { Faker::Name.last_name + "@sun-asterisk.com" }
    password { SecureRandom.hex(8) }
  end
end
