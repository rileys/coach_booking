FactoryBot.define do
  factory :coach do
    name { Faker::Name.unique.name }
    time_zone { Faker::Address.time_zone }
    time_zone_string { time_zone }
  end
end
