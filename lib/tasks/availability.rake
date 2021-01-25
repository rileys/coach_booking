require 'csv'

namespace :availability do
  TIME_FORMAT = "%I:%M %P"

  desc "Import Coaches availability from CSV.  Create Coach if doesn't exist."
  task import: :environment do
    CSV.foreach(ARGV[1], headers: true, header_converters: :symbol) do |row|
      coach = Coach.find_or_initialize_by(name: row[:name])

      if coach.new_record?
        coach.time_zone_string = row[:timezone]
        coach.time_zone = row[:timezone].partition(') ').last
        coach.save
      end

      weekday = Date.parse(row[:day_of_week]).wday
      start_time = Time.strptime(row[:available_at], TIME_FORMAT)
      end_time = Time.strptime(row[:available_until], TIME_FORMAT)
      coach.available_weekdays.create(weekday: weekday, start_time: start_time, end_time: end_time)
    end
  end
end
