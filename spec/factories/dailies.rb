FactoryBot.define do
  factory :daily do
    date { "2014-09-18" }
    discount { 0 }
    start_time_order { DateTime.now }
    end_time_order { DateTime.now + 1.hour }
  end
end
