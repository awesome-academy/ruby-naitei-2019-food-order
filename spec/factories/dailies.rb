FactoryBot.define do
  factory :daily do
    date { "2014-09-18" }
    discount { 0 }
    start_time_order { "2014-09-18 8:30:00 +0700" }
    end_time_order { "2014-09-18 11:30:00 +0700" }
  end
end
