FactoryBot.define do
  factory :available_weekday do
    coach
    weekday { rand(0..6) }
    start_time do
      Time.new.change(hour: rand(0..12), min: [0, 30].sample)
    end
    end_time { start_time + 8.hours }
  end
end
